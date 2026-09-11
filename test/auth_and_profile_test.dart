import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp_app/core/errors/failures.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/features/auth/data/mappers/auth_mappers.dart';
import 'package:shopp_app/features/auth/data/models/user_model.dart';
import 'package:shopp_app/features/auth/domain/entities/user_entity.dart';
import 'package:shopp_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:shopp_app/features/auth/presentation/providers/auth_providers.dart';

class MockAuthRepository implements AuthRepository {
  UserEntity? loggedInUser;
  bool shouldFail = false;

  @override
  Future<Result<UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    if (shouldFail) {
      return const FailureResult(AuthFailure('Invalid credentials', 401));
    }
    if (email == 'alice@shoppy.local') {
      loggedInUser = const UserEntity(
        id: 'user_alice_123',
        name: 'Alice Wonderland',
        email: 'alice@shoppy.local',
        role: 'CUSTOMER',
        phone: '+1 (555) 111-2222',
      );
    } else if (email == 'bob@shoppy.local') {
      loggedInUser = const UserEntity(
        id: 'user_bob_456',
        name: 'Bob Builder',
        email: 'bob@shoppy.local',
        role: 'CUSTOMER',
        phone: '+1 (555) 333-4444',
      );
    } else {
      loggedInUser = UserEntity(
        id: 'user_generic',
        name: 'Test User',
        email: email,
        role: 'CUSTOMER',
      );
    }
    return Success(loggedInUser!);
  }

  @override
  Future<Result<UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return Success(UserEntity(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      role: 'CUSTOMER',
    ));
  }

  @override
  Future<Result<UserEntity>> getCurrentUser() async {
    if (shouldFail) {
      return const FailureResult(AuthFailure('Unauthorized token', 401));
    }
    if (loggedInUser != null) {
      return Success(loggedInUser!);
    }
    return const FailureResult(AuthFailure('No active session', 401));
  }

  @override
  Future<Result<void>> logout() async {
    loggedInUser = null;
    return const Success(null);
  }

  @override
  Future<Result<UserEntity>> updateProfile({
    String? fullName,
    String? phone,
    String? avatar,
  }) async {
    if (loggedInUser == null) {
      return const FailureResult(AuthFailure('Not authenticated', 401));
    }
    loggedInUser = loggedInUser!.copyWith(
      name: fullName ?? loggedInUser!.name,
      phone: phone ?? loggedInUser!.phone,
      avatar: avatar ?? loggedInUser!.avatar,
    );
    return Success(loggedInUser!);
  }

  @override
  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return const Success(null);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Real Authentication & Profile Verification Tests', () {
    late MockAuthRepository mockRepo;
    late ProviderContainer container;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await Preferences.init();
      await Preferences.clearAuth();
      mockRepo = MockAuthRepository();

      container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(mockRepo),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('1. User A (Alice) signs in and Profile correctly reflects Alice identity', () async {
      final authNotifier = container.read(authStateProvider.notifier);

      final success = await authNotifier.signIn('alice@shoppy.local', 'Secret@123');
      expect(success, isTrue);

      final currentUser = container.read(currentUserProvider);
      expect(currentUser, isNotNull);
      expect(currentUser!.name, 'Alice Wonderland');
      expect(currentUser.email, 'alice@shoppy.local');
      expect(currentUser.id, 'user_alice_123');
      expect(currentUser.phone, '+1 (555) 111-2222');
      expect(container.read(isAuthenticatedProvider), isTrue);
    });

    test('2. User Isolation: Logging out User A and logging in User B completely replaces profile', () async {
      final authNotifier = container.read(authStateProvider.notifier);

      // Step 1: Sign in Alice
      await authNotifier.signIn('alice@shoppy.local', 'Secret@123');
      expect(container.read(currentUserProvider)!.name, 'Alice Wonderland');

      // Step 2: Logout Alice
      await authNotifier.logout();
      expect(container.read(currentUserProvider), isNull);
      expect(container.read(isAuthenticatedProvider), isFalse);

      // Step 3: Sign in Bob
      final bobSuccess = await authNotifier.signIn('bob@shoppy.local', 'Secret@456');
      expect(bobSuccess, isTrue);

      final bobUser = container.read(currentUserProvider);
      expect(bobUser, isNotNull);
      expect(bobUser!.name, 'Bob Builder');
      expect(bobUser.email, 'bob@shoppy.local');
      expect(bobUser.id, 'user_bob_456');
      expect(bobUser.phone, '+1 (555) 333-4444');

      // Crucial: No residual Alice data
      expect(bobUser.name, isNot('Alice Wonderland'));
      expect(bobUser.email, isNot('alice@shoppy.local'));
    });

    test('3. Auth Restoration: Active session restores authenticated user via getCurrentUser', () async {
      mockRepo.loggedInUser = const UserEntity(
        id: 'user_restored_999',
        name: 'Restored User',
        email: 'restored@shoppy.local',
        role: 'CUSTOMER',
      );

      final authNotifier = container.read(authStateProvider.notifier);
      await authNotifier.fetchCurrentUser();

      final currentUser = container.read(currentUserProvider);
      expect(currentUser, isNotNull);
      expect(currentUser!.name, 'Restored User');
      expect(currentUser.email, 'restored@shoppy.local');
      expect(container.read(isAuthenticatedProvider), isTrue);
    });

    test('4. Freezed UserModel properly serializes and maps to UserEntity', () {
      final json = {
        '_id': 'mongo_id_555',
        'fullName': 'Elena Gilbert',
        'email': 'elena@shoppy.local',
        'role': 'CUSTOMER',
        'phone': '+1 (555) 777-8888',
        'notificationPreferences': {
          'orderUpdates': true,
          'promotions': false,
          'wishlistAlerts': true,
        },
      };

      final model = UserModel.fromJson(json);
      expect(model.id, 'mongo_id_555');
      expect(model.name, 'Elena Gilbert');
      expect(model.email, 'elena@shoppy.local');
      expect(model.phone, '+1 (555) 777-8888');
      expect(model.promotions, isFalse);

      final entity = model.toEntity();
      expect(entity.id, model.id);
      expect(entity.name, model.name);
      expect(entity.email, model.email);
      expect(entity.phone, model.phone);
      expect(entity.promotions, isFalse);
    });

    test('5. Unauthorized session failure resets auth state cleanly', () async {
      mockRepo.shouldFail = true;

      final authNotifier = container.read(authStateProvider.notifier);
      await authNotifier.fetchCurrentUser();

      expect(container.read(currentUserProvider), isNull);
      expect(container.read(isAuthenticatedProvider), isFalse);
    });
  });
}
