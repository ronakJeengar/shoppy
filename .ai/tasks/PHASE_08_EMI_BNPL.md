# Phase 08 — India-First EMI & Buy Now, Pay Later (BNPL) System (Flutter)

## Overview
Flutter client integration for Feature 8: India-First EMI & BNPL Financing architecture.
Follows strict **Backend-First** execution: the app performs zero interest, fee, or installment calculations locally and consumes authoritative quotes and plan structures from the backend.

## Architectural Layers

### 1. Domain Entities (`lib/features/emi/domain/entities/emi_plan_entity.dart`)
- Freezed immutable entities:
  - `EmiTenureEntity`: tenureId, months, interestRate, isNoCost, processingFee, monthlyInstallment, totalInterest, totalRepaid, totalPayable.
  - `EmiPlanEntity`: id, planId, provider, providerCode, providerType, minAmount, maxAmount, isEligible, tenures.
  - `EmiEligibilityEntity`: eligible, reasonCode, message, minOrderValue, maxOrderValue.
  - `EmiPlansResponseEntity`: currency, currencySymbol, amount, eligible, reasonCode, message, plans.
  - `EmiQuoteEntity`: authoritative single-plan quote.
  - `EmiDetailsSnapshotEntity`: immutable snapshot embedded in Order and Payment models.

### 2. Data Models & Mappers
- `lib/features/emi/data/models/emi_plan_model.dart`: Freezed models with `fromJson`/`toJson`.
- `lib/features/emi/data/mappers/emi_mappers.dart`: Clean entity $\leftrightarrow$ model conversion extensions.
- `lib/features/orders/data/models/order_model.dart` & `order_entity.dart`: Integrated `emiDetails` and `isEmi`, `isPendingPayment` getters.

### 3. Networking & Repository
- `EmiRemoteDataSource` (`lib/features/emi/data/datasources/emi_remote_datasource.dart`):
  - Calls `GET /emi/plans?amount=:amount` and `POST /emi/calculate`.
- `EmiRepository` & `EmiRepositoryImpl` (`lib/features/emi/domain/repositories/` and `data/repositories/`).
- Use cases: `GetEmiPlansUseCase`, `CalculateEmiQuoteUseCase`.

### 4. Riverpod State Management (`lib/features/emi/presentation/providers/emi_providers.dart`)
- `emiPlansProvider(double amount)`: Family FutureProvider fetching authoritative plans and quotes.
- `selectedEmiSelectionProvider`: StateProvider holding user's active bank & tenure selection.

### 5. UI Components & Flow
- `EmiPlanSelectorWidget`:
  - Bank selector horizontal chip list with active indicators.
  - Tenure cards with hero monthly installments (`₹X,XXX/mo`), duration badges, No-Cost EMI badges, and breakdown details (rate, total interest, processing fee).
  - Strict design system compliance: 100% custom SVG `AppIcon` (`zero Icons.*` violations).
- `CheckoutPage`:
  - Payment method toggle: Credit/Debit Card, Cash on Delivery, or EMI / Pay in Installments.
  - Interactive EMI plan selector embedded within payment method section.
  - Bottom bar enforces plan selection (`Select EMI Plan` $\to$ `Confirm EMI Order`), shows monthly installment.
- `OrderConfirmationPage`:
  - Renders EMI financing snapshot card (Bank, Tenure, Monthly Installment, Interest, Processing Fee, Total Financed Order).
- `OrderDetailPage`:
  - Dedicated EMI Financing Details card with full loan parameters.

## Tests & Verification
- `test/emi_integration_test.dart`: 9 tests covering models, serialization, mapping, getters, and equality.
- Zero Material/Cupertino icon violations enforced across entire codebase.
