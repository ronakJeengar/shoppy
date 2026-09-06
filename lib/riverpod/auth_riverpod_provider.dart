import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/data/models/currrent_user_model.dart';
import 'package:shopp_app/data/models/user_model.dart';
import 'package:shopp_app/data/repositories/auth_repository.dart';
import 'package:shopp_app/domain/models/ui_state.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthState {
  final UiState<CurrentUserModel?> userState;
  final bool isAuthenticated;
  final String? errorMessage;

  const AuthState({
    required this.userState,
    required this.isAuthenticated,
    this.errorMessage,
  });

  factory AuthState.initial() => AuthState(
        userState: const UiState.initial(),
        isAuthenticated: Preferences.getAccessToken() != null,
      );

  AuthState copyWith({
    UiState<CurrentUserModel?>? userState,
    bool? isAuthenticated,
    String? errorMessage,
  }) {
    return AuthState(
      userState: userState ?? this.userState,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(AuthState.initial()) {
    if (state.isAuthenticated) {
      fetchCurrentUser();
    }
  }

  Future<bool> signIn(String email, String password) async {
    state = state.copyWith(userState: const UiState.loading(), errorMessage: null);
    try {
      final response = await _repository.signIn(loginData: {
        'email': email.trim(),
        'password': password,
      });

      if (response.status && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        final accessToken = (data['accessToken'] ?? data['token'] ?? '').toString();
        final refreshToken = data['refreshToken']?.toString();

        await Preferences.saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        CurrentUserModel? user;
        if (data['user'] != null && data['user'] is Map<String, dynamic>) {
          user = CurrentUserModel.fromJson(data['user'] as Map<String, dynamic>);
        } else {
          final meRes = await _repository.getCurrentUser();
          if (meRes.status && meRes.data is Map<String, dynamic>) {
            user = CurrentUserModel.fromJson(meRes.data as Map<String, dynamic>);
          }
        }

        state = state.copyWith(
          userState: UiState.success(user),
          isAuthenticated: true,
          errorMessage: null,
        );
        return true;
      } else {
        state = state.copyWith(
          userState: UiState.error(response.message),
          isAuthenticated: false,
          errorMessage: response.message,
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        userState: UiState.error(e.toString()),
        isAuthenticated: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<bool> signUp(User user) async {
    state = state.copyWith(userState: const UiState.loading(), errorMessage: null);
    try {
      final response = await _repository.signUp(userData: user);
      if (response.status) {
        state = state.copyWith(
          userState: const UiState.initial(),
          errorMessage: null,
        );
        return true;
      } else {
        state = state.copyWith(
          userState: UiState.error(response.message),
          errorMessage: response.message,
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        userState: UiState.error(e.toString()),
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<void> fetchCurrentUser() async {
    state = state.copyWith(userState: const UiState.loading());
    try {
      final response = await _repository.getCurrentUser();
      if (response.status && response.data is Map<String, dynamic>) {
        final user = CurrentUserModel.fromJson(response.data as Map<String, dynamic>);
        state = state.copyWith(
          userState: UiState.success(user),
          isAuthenticated: true,
        );
      } else {
        state = state.copyWith(
          userState: UiState.error(response.message),
          isAuthenticated: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        userState: UiState.error(e.toString()),
        isAuthenticated: false,
      );
    }
  }

  Future<bool> updateProfile({String? fullName, String? phone, String? avatar}) async {
    try {
      final response = await _repository.updateProfile(
        fullName: fullName,
        phone: phone,
        avatar: avatar,
      );
      if (response.status && response.data is Map<String, dynamic>) {
        final user = CurrentUserModel.fromJson(response.data as Map<String, dynamic>);
        state = state.copyWith(userState: UiState.success(user));
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _repository.logout();
    } catch (_) {}
    await Preferences.clearAuth();
    state = const AuthState(
      userState: UiState.initial(),
      isAuthenticated: false,
    );
  }
}

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});

final currentUserProvider = Provider<CurrentUserModel?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.userState.dataOrNull;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider).isAuthenticated;
});
