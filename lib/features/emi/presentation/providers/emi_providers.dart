import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/emi_remote_datasource.dart';
import '../../data/repositories/emi_repository_impl.dart';
import '../../domain/entities/emi_plan_entity.dart';
import '../../domain/repositories/emi_repository.dart';
import '../../domain/usecases/calculate_emi_quote_usecase.dart';
import '../../domain/usecases/get_emi_plans_usecase.dart';

final emiRemoteDataSourceProvider = Provider<EmiRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return EmiRemoteDataSourceImpl(client);
});

final emiRepositoryProvider = Provider<EmiRepository>((ref) {
  final remote = ref.watch(emiRemoteDataSourceProvider);
  return EmiRepositoryImpl(remote);
});

final getEmiPlansUseCaseProvider = Provider<GetEmiPlansUseCase>((ref) {
  final repo = ref.watch(emiRepositoryProvider);
  return GetEmiPlansUseCase(repo);
});

final calculateEmiQuoteUseCaseProvider = Provider<CalculateEmiQuoteUseCase>((ref) {
  final repo = ref.watch(emiRepositoryProvider);
  return CalculateEmiQuoteUseCase(repo);
});

class SelectedEmiSelection {
  final EmiPlanEntity plan;
  final EmiTenureEntity tenure;

  const SelectedEmiSelection({
    required this.plan,
    required this.tenure,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedEmiSelection &&
          runtimeType == other.runtimeType &&
          plan.planId == other.plan.planId &&
          tenure.months == other.tenure.months;

  @override
  int get hashCode => plan.planId.hashCode ^ tenure.months.hashCode;
}

/// Holds user's currently selected EMI plan and tenure at checkout
final selectedEmiSelectionProvider = StateProvider<SelectedEmiSelection?>((ref) => null);

/// FutureProvider that fetches available plans and authoritative quotes for a given checkout amount
final emiPlansProvider = FutureProvider.family<EmiPlansResponseEntity, double>((ref, amount) async {
  final useCase = ref.watch(getEmiPlansUseCaseProvider);
  final result = await useCase(amount: amount);

  return result.fold(
    onSuccess: (data) => data,
    onFailure: (failure) => throw failure,
  );
});
