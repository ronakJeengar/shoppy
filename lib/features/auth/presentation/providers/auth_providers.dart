import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/preferences.dart';
import '../../../../core/utils/ui_state.dart';
export '../../../../core/utils/ui_state.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_usecases.dart';

/// Auth Data Source Provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return AuthRemoteDataSourceImpl(client);
});

/// Auth Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});

/// Use Case Providers
final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(ref.watch(authRepositoryProvider));
});

final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  return GetCurrentUserUseCase(ref.watch(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
});

final updateProfileUseCaseProvider = Provider<UpdateProfileUseCase>((ref) {
  return UpdateProfileUseCase(ref.watch(authRepositoryProvider));
});

final changePasswordUseCaseProvider = Provider<ChangePasswordUseCase>((ref) {
  return ChangePasswordUseCase(ref.watch(authRepositoryProvider));
});

/// Auth UI State
class AuthState {
  final UiState<UserEntity?> userState;
  final bool isAuthenticated;
  final String? errorMessage;
  final bool isLoading;

  const AuthState({
    required this.userState,
    required this.isAuthenticated,
    this.errorMessage,
    this.isLoading = false,
  });

  factory AuthState.initial() => AuthState(
        userState: const UiState.initial(),
        isAuthenticated: Preferences.getAccessToken() != null,
      );

  UserEntity? get user => userState.dataOrNull;

  AuthState copyWith({
    UiState<UserEntity?>? userState,
    bool? isAuthenticated,
    String? errorMessage,
    bool? isLoading,
  }) {
    return AuthState(
      userState: userState ?? this.userState,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Auth State Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutUseCase _logoutUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;

  AuthNotifier({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required LogoutUseCase logoutUseCase,
    required UpdateProfileUseCase updateProfileUseCase,
    required ChangePasswordUseCase changePasswordUseCase,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _getCurrentUserUseCase = getCurrentUserUseCase,
        _logoutUseCase = logoutUseCase,
        _updateProfileUseCase = updateProfileUseCase,
        _changePasswordUseCase = changePasswordUseCase,
        super(AuthState.initial()) {
    if (state.isAuthenticated) {
      fetchCurrentUser();
    }
  }

  Future<bool> signIn(String email, String password) async {
    state = state.copyWith(
      userState: const UiState.loading(),
      isLoading: true,
      errorMessage: null,
    );

    final result = await _signInUseCase(
      email: email,
      password: password,
    );

    return result.fold(
      onSuccess: (user) {
        state = state.copyWith(
          userState: UiState.success(user),
          isAuthenticated: true,
          isLoading: false,
          errorMessage: null,
        );
        return true;
      },
      onFailure: (failure) {
        state = state.copyWith(
          userState: UiState.error(failure.message),
          isAuthenticated: false,
          isLoading: false,
          errorMessage: failure.message,
        );
        return false;
      },
    );
  }

  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(
      userState: const UiState.loading(),
      isLoading: true,
      errorMessage: null,
    );

    final result = await _signUpUseCase(
      name: name,
      email: email,
      password: password,
    );

    return result.fold(
      onSuccess: (user) {
        state = state.copyWith(
          userState: UiState.success(user),
          isLoading: false,
          errorMessage: null,
        );
        return true;
      },
      onFailure: (failure) {
        state = state.copyWith(
          userState: UiState.error(failure.message),
          isLoading: false,
          errorMessage: failure.message,
        );
        return false;
      },
    );
  }

  Future<void> fetchCurrentUser() async {
    state = state.copyWith(userState: const UiState.loading(), isLoading: true);
    final result = await _getCurrentUserUseCase();

    result.fold(
      onSuccess: (user) {
        state = state.copyWith(
          userState: UiState.success(user),
          isAuthenticated: true,
          isLoading: false,
          errorMessage: null,
        );
      },
      onFailure: (failure) {
        state = state.copyWith(
          userState: UiState.error(failure.message),
          isLoading: false,
          errorMessage: failure.message,
        );
      },
    );
  }

  Future<void> logout() async {
    await _logoutUseCase();
    state = const AuthState(
      userState: UiState.initial(),
      isAuthenticated: false,
    );
  }

  Future<bool> updateProfile({
    String? fullName,
    String? phone,
    String? avatar,
  }) async {
    state = state.copyWith(isLoading: true);
    final result = await _updateProfileUseCase(
      fullName: fullName,
      phone: phone,
      avatar: avatar,
    );

    return result.fold(
      onSuccess: (user) {
        state = state.copyWith(
          userState: UiState.success(user),
          isLoading: false,
          errorMessage: null,
        );
        return true;
      },
      onFailure: (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
        return false;
      },
    );
  }

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = state.copyWith(isLoading: true);
    final result = await _changePasswordUseCase(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    return result.fold(
      onSuccess: (_) {
        state = state.copyWith(isLoading: false, errorMessage: null);
        return true;
      },
      onFailure: (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
        return false;
      },
    );
  }
}

/// Global AuthState provider
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    signInUseCase: ref.watch(signInUseCaseProvider),
    signUpUseCase: ref.watch(signUpUseCaseProvider),
    getCurrentUserUseCase: ref.watch(getCurrentUserUseCaseProvider),
    logoutUseCase: ref.watch(logoutUseCaseProvider),
    updateProfileUseCase: ref.watch(updateProfileUseCaseProvider),
    changePasswordUseCase: ref.watch(changePasswordUseCaseProvider),
  );
});

/// Convenience provider for current user entity
final currentUserProvider = Provider<UserEntity?>((ref) {
  return ref.watch(authStateProvider).user;
});

/// Convenience provider for authentication status
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider).isAuthenticated;
});
