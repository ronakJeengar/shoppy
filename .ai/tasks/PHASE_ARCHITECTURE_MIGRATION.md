# PHASE ARCHITECTURE MIGRATION AUDIT & PLAN

## 1. Current Architecture (As-Is Audit)
The Flutter application currently has a hybrid architecture resulting from incremental feature implementations:
* **Presentation**: Views in `lib/views/` and `lib/views/widgets/` rely on `package:provider` (`ChangeNotifierProvider`, `context.watch`, `context.read`, `Consumer`).
* **State Management**: Duplicate parallel layers:
  - 13 legacy `ChangeNotifier` classes in `lib/providers/`.
  - 12 Riverpod StateNotifiers / Notifiers in `lib/riverpod/`.
  - `MultiProvider` in `lib/main.dart` and `test/widget_test.dart` mounting all 13 legacy providers inside a `ProviderScope`.
* **Data Layer**: Repositories in `lib/data/repositories/` directly invoke `Api` (`lib/core/api.dart`) without an intermediate `DataSource` layer or abstraction.
* **Domain Layer**: Lacks formal Use Cases and Repository Contracts. Models in `lib/data/models/` serve as both API response representations and presentation objects.
* **Routing**: Centralized `GoRouter` in `lib/core/router/app_router.dart`, listening to Riverpod `authStateProvider`, but screen actions often fallback to legacy `Navigator.push(MaterialPageRoute(...))`.

---

## 2. Problems Found
1. **Dual State Management**: `package:provider` and `hooks_riverpod` coexist, creating architectural confusion and potential synchronization defects.
2. **Missing Clean Architecture Boundaries**:
   - No `domain/` layer containing repository interfaces or use cases.
   - UI widgets directly access repository methods via legacy `ChangeNotifier`.
   - Data layer lacks distinct remote/local data sources (`RemoteDataSource`, `LocalDataSource`).
3. **Model / Entity Conflation**: Data models handle raw JSON deserialization and double as UI entities without separation.
4. **Ad-Hoc Navigation Mixed with GoRouter**: Screens like `login_page.dart`, `cart_page.dart`, `wishlist_page.dart` call `Navigator.push(MaterialPageRoute(...))` rather than declarative GoRouter methods.
5. **Direct API instantiation**: `Api` is instantiated and used in repository implementations directly rather than being injected through Riverpod.

---

## 3. Provider Usage Audit
Search across `lib/` identified 27 files importing `package:provider/provider.dart`:
- `lib/main.dart`
- `lib/providers/*.dart` (13 files)
- `lib/views/profile_page.dart`
- `lib/views/widgets/product_card.dart`
- `lib/views/search_page.dart`
- `lib/views/sign_up_page.dart`
- `lib/views/widgets/address_form_dialog.dart`
- `lib/views/widgets/category_selector.dart`
- `lib/views/cart_page.dart`
- `lib/views/order_detail_page.dart`
- `lib/views/checkout_page.dart`
- `lib/views/orders_page.dart`
- `lib/views/addresses_page.dart`
- `lib/views/widgets/write_review_dialog.dart`
- `lib/views/assistant_page.dart`
- `lib/views/wishlist_page.dart`
- `lib/views/notifications_page.dart`
- `lib/views/widgets/filter_bottom_sheet.dart`
- `lib/views/admin/*.dart` (6 files)
- `lib/views/product_detail_page.dart`
- `lib/views/home_page.dart`
- `lib/views/login_page.dart`

---

## 4. Target Architecture (Feature-First Clean Architecture)
Every feature will reside in `lib/features/<feature>/`:
```text
lib/
├── core/
│   ├── constants/        ← Centralized tokens (strings, endpoints, assets, routes, storage)
│   ├── errors/           ← Centralized domain failures (Failure, ServerFailure, etc.)
│   ├── network/          ← ApiClient, interceptors, network result
│   ├── router/           ← Declarative GoRouter, ShellRoute, route guards
│   ├── storage/          ← Local & Secure storage wrappers
│   ├── theme/            ← Colors, dimensions, typography, shadows, radius, motion
│   ├── utils/            ← Result<T>, formatting helpers
│   └── widgets/          ← Atomic reusable UI (AppButton, AppTextField, EmptyStateView)
│
├── features/
│   ├── auth/
│   ├── home/
│   ├── catalog/
│   ├── search/
│   ├── cart/
│   ├── wishlist/
│   ├── checkout/
│   ├── orders/
│   ├── profile/
│   ├── addresses/
│   ├── notifications/
│   ├── reviews/
│   ├── recommendations/
│   ├── admin/
│   └── ai/
│
└── app/
    ├── app.dart          ← ShoppyApp root widget with Riverpod & GoRouter
    ├── bootstrap.dart    ← App initialization & pre-run configuration
    └── app_providers.dart← Global infrastructure providers
```

Each feature follows the strict 3-tier structure:
```text
feature/
├── data/
│   ├── datasources/      ← <feature>_remote_datasource.dart, <feature>_local_datasource.dart
│   ├── models/           ← Freezed & Serializable data transfer models
│   └── repositories/     ← <feature>_repository_impl.dart
├── domain/
│   ├── entities/         ← Immutable Freezed business entities
│   ├── repositories/     ← <feature>_repository.dart (abstract interface)
│   └── usecases/         ← Discrete, testable use cases
└── presentation/
    ├── providers/        ← Riverpod Notifiers / StateNotifiers
    ├── screens/          ← ConsumerWidget / HookConsumerWidget screens
    ├── state/            ← Freezed presentation UI states (Initial, Loading, Loaded, Error)
    └── widgets/          ← Feature-specific presentation widgets
```

---

## 5. Files To Remove & Files To Refactor
### Files to Remove:
- All 13 files in `lib/providers/` (`address_provider.dart`, `user_provider.dart`, etc.)
- Legacy `lib/riverpod/` temporary bridge files once consolidated into feature folders.
- `package:provider` dependency from `pubspec.yaml`.

### Files to Refactor / Relocate:
- `lib/views/*` -> Relocate into respective `lib/features/<feature>/presentation/screens/` and convert from `StatefulWidget`/`Provider` to `ConsumerWidget` / `HookConsumerWidget`.
- `lib/views/widgets/*` -> Relocate generic widgets to `lib/core/widgets/` and feature-specific widgets to `lib/features/<feature>/presentation/widgets/`.
- `lib/data/repositories/*` -> Implement clean interfaces in `lib/features/<feature>/domain/repositories/` and implement in `lib/features/<feature>/data/repositories/`.
- `lib/data/models/*` -> Refactor into domain `entities/` and data `models/` with `toEntity()` / `toModel()` converters.

---

## 6. Migration Plan (Execution Order)
1. **Phase 1: Core Foundation & Infrastructure**
   - Setup `lib/core/errors/` with typed `Failure` hierarchy.
   - Setup `lib/core/utils/` with type-safe `Result<T>` pattern.
   - Setup `lib/core/network/` with `ApiClient` and Riverpod `apiClientProvider`.
   - Setup `lib/core/storage/` with `SecureStorageService` and `LocalStorageService`.
2. **Phase 2: Feature Domain & Data Layers**
   - For each feature (`auth`, `catalog`, `cart`, `wishlist`, `checkout`, `orders`, `addresses`, `notifications`, `reviews`, `recommendations`, `ai`, `admin`, `search`, `home`):
     - Create Freezed Entities & Data Models with JSON serialization.
     - Create Data Sources (Remote & Local).
     - Create Domain Repository Interface & Data Implementation.
     - Create Domain Use Cases.
3. **Phase 3: Riverpod Presentation Controllers & UI States**
   - Create Freezed UI state classes for each feature.
   - Create Riverpod Notifier controllers injecting use cases.
   - Migrate presentation screens and widgets to `ConsumerWidget` / `HookConsumerWidget`.
   - Update GoRouter to point to feature screens.
4. **Phase 4: Remove Legacy Provider & Dead Code**
   - Remove `lib/providers/`.
   - Remove `legacy_provider` from `pubspec.yaml`.
   - Update `main.dart` and `bootstrap.dart` to pure `ProviderScope`.
5. **Phase 5: Verification & Testing**
   - Migrate all test suites to use pure Riverpod `ProviderContainer` and `ProviderScope(overrides: [...])`.
   - Run `flutter analyze` (0 issues).
   - Run `flutter test` (all tests passing).
   - Verify backend remains 100% green (199/199 passing).

---

## 7. Migration Results & Status: COMPLETED ✅

1. **Clean Architecture & Features**:
   - 14 feature modules created under `lib/features/` with strict Clean Architecture separation: `domain/` (entities, repository contracts, usecases), `data/` (datasources, models, mappers, repository implementations), `presentation/` (Riverpod notifiers & state).
   - Core foundations established in `lib/core/` (`errors/`, `network/`, `storage/`, `utils/`, `widgets/`).
2. **State Management**:
   - Zero `package:provider` dependencies in `pubspec.yaml` or application code.
   - All 13 legacy `lib/providers/` and 12 `lib/riverpod/` bridge files completely removed.
   - Pure `ProviderScope` in `main.dart` with Riverpod DI for all view layers.
   - Every view converted to `ConsumerWidget`, `ConsumerStatefulWidget`, or `HookConsumerWidget`.
3. **Verification**:
   - `flutter analyze`: **0 issues found** across the entire Flutter codebase.
   - `flutter test`: **64 / 64 tests passing** (unit, component, router, and widget test suites).
   - Backend verification: **199 / 199 tests passing** across 29 test suites.
   - Authoritative commerce totals strictly maintained on backend.

