# SHOPPY DESIGN SYSTEM SPECIFICATION

## 1. Design Philosophy & Vision

The Shoppy Design System bridges design aesthetics and software engineering to deliver a commercial, Figma-quality mobile commerce experience.
Built on systematic design tokens, predictable spacing grids, high-contrast typography, and fluid micro-interactions, the design system ensures:

* **Visual Consistency**: Unified appearance across all catalog, cart, checkout, order, and AI screens.
* **60 FPS Rendering**: Strict memory-bounded image caching, shimmer placeholders, and minimal layout rebuilds.
* **State Clarity**: Explicit UI state representation (`initial`, `loading`, `success`, `empty`, `error`) across every user touchpoint.
* **Accessibility**: High-contrast slate neutrals, touch target minimums (48x48 pt), and screen-reader compatible semantics.

---

## 2. Design Tokens Reference

### 2.1 Color Palette (`lib/core/theme/app_colors.dart`)

```dart
// Brand Primary
static const Color primary       = Color(0xFF4F46E5); // Indigo 600
static const Color primaryHover  = Color(0xFF4338CA); // Indigo 700
static const Color primaryLight  = Color(0xFF6366F1); // Indigo 500
static const Color primary50     = Color(0xFFEEF2FF); // Indigo 50
static const Color primary100    = Color(0xFFE0E7FF); // Indigo 100

// Brand Accents
static const Color accent        = Color(0xFFF59E0B); // Amber 500
static const Color accentLight   = Color(0xFFFEF3C7);
static const Color coral         = Color(0xFFEC4899); // Pink / Coral
static const Color violet        = Color(0xFF8B5CF6); // AI Purple

// Semantic Status
static const Color success       = Color(0xFF10B981); // Emerald 500
static const Color successLight  = Color(0xFFECFDF5);
static const Color warning       = Color(0xFFF59E0B); // Amber 500
static const Color warningLight  = Color(0xFFFFFBEB);
static const Color error         = Color(0xFFEF4444); // Red 500
static const Color errorLight    = Color(0xFFFEF2F2);
static const Color info          = Color(0xFF3B82F6); // Blue 500
static const Color infoLight     = Color(0xFFEFF6FF);

// Slate Neutrals
static const Color slate950      = Color(0xFF020617);
static const Color slate900      = Color(0xFF0F172A); // Headings & Dark Text
static const Color slate800      = Color(0xFF1E293B);
static const Color slate700      = Color(0xFF334155); // Body Text
static const Color slate600      = Color(0xFF475569); // Secondary Text
static const Color slate500      = Color(0xFF64748B); // Muted / Captions
static const Color slate400      = Color(0xFF94A3B8); // Subtle Icons / Borders
static const Color slate300      = Color(0xFFCBD5E1); // Input Borders
static const Color slate200      = Color(0xFFE2E8F0); // Dividers & Card Outlines
static const Color slate100      = Color(0xFFF1F5F9); // Input Backgrounds / Chip BG
static const Color slate50       = Color(0xFFF8FAFC); // App Canvas Background
static const Color white         = Color(0xFFFFFFFF); // Surfaces
```

### 2.2 Typography Scale (`lib/core/theme/app_typography.dart`)

| Token | Size | Weight | Line Height | Usage |
|---|---|---|---|---|
| `displayLarge` | 28 pt | 800 (Bold) | 1.2 | Hero page headers |
| `displayMedium` | 24 pt | 700 (Bold) | 1.25 | Section banners |
| `headingLarge` | 20 pt | 700 (Bold) | 1.3 | Modal & dialog titles |
| `headingMedium` | 18 pt | 600 (Semi-bold) | 1.35 | Section headers |
| `headingSmall` | 16 pt | 600 (Semi-bold) | 1.4 | Card headers |
| `subtitleLarge` | 15 pt | 500 (Medium) | 1.4 | Card subtitles |
| `subtitleMedium` | 13 pt | 500 (Medium) | 1.4 | Secondary descriptions |
| `bodyLarge` | 14 pt | 400 (Regular) | 1.5 | Primary article text |
| `bodyMedium` | 13 pt | 400 (Regular) | 1.45 | Standard body text |
| `bodySmall` | 12 pt | 400 (Regular) | 1.4 | Dense item details |
| `caption` | 11 pt | 500 (Medium) | 1.3 | Badges & timestamps |
| `label` | 10 pt | 700 (Bold) | 1.2 | Uppercase brand chips |
| `priceHero` | 26 pt | 800 (Bold) | 1.1 | Product detail price |
| `priceCard` | 16 pt | 700 (Bold) | 1.2 | Product card price |

### 2.3 Spacing Grid (`lib/core/theme/app_spacing.dart`)

Standard 4pt / 8pt geometric progression:
* `xxs`: 2.0 pt
* `xs`: 4.0 pt
* `sm`: 8.0 pt
* `md`: 12.0 pt
* `lg`: 16.0 pt
* `xl`: 20.0 pt
* `xxl`: 24.0 pt
* `xxxl`: 32.0 pt
* `huge`: 48.0 pt

### 2.4 Corner Radii (`lib/core/theme/app_radius.dart`)

* `xs`: 4.0 pt (Chips, small badges)
* `sm`: 8.0 pt (Buttons, input fields, thumbnails)
* `md`: 12.0 pt (Cards, interactive tiles)
* `lg`: 16.0 pt (Modals, bottom sheets, timeline containers)
* `xl`: 24.0 pt (Featured hero cards)
* `full`: 999.0 pt (Pills, circular avatar buttons)

### 2.5 Shadows & Elevation (`lib/core/theme/app_shadows.dart`)

* `card`: Subtle multi-layer ambient shadow (`Offset(0, 1)`, blur 3, opacity 0.05).
* `dropdown`: Mid-level elevation (`Offset(0, 4)`, blur 12, opacity 0.08).
* `modal`: Floating overlay elevation (`Offset(0, 10)`, blur 25, opacity 0.12).

---

## 3. Core Component Library

1. **`AppButton` (`lib/views/widgets/app_button.dart`)**:
   - Primary, secondary, text, and danger variants.
   - Built-in loading spinner (`CircularProgressIndicator`), disabled states, and icon prefixes.
   - Preserves standard Flutter button finders for automated testing.

2. **`AppTextField` (`lib/views/widgets/app_text_field.dart`)**:
   - Outlined modern input with label, hint, error text, prefix and suffix icons.
   - Seamless validation handling with slate-200 / slate-300 borders and focus glow.

3. **`AppNetworkImage` (`lib/views/widgets/app_network_image.dart`)**:
   - Production-grade network image widget built on `cached_network_image`.
   - Automatic memory constraints (`memCacheWidth`, `memCacheHeight`) prevents frame jank.
   - Integrated `SkeletonLoader` shimmer placeholder and elegant error fallback.

4. **`OrderTimeline` (`lib/views/widgets/order_timeline.dart`)**:
   - Visual multi-step fulfillment stepper (`Placed` -> `Processing` -> `Shipped` -> `Delivered`).
   - Dynamic carrier badge with one-tap clipboard copy for tracking numbers.
   - Dedicated error banner for cancelled orders with structured reason display.

5. **`ProductCard` (`lib/views/widgets/product_card.dart`)**:
   - Figma-quality product card with rating chip, stock urgency banner, quick wishlist toggle, and instant add-to-cart button.

6. **`CartItemTile` (`lib/views/widgets/cart_item_tile.dart`)**:
   - Compact shopping cart line item with seller attribution, quantity stepper, and remove action.

7. **`EmptyState` & `ErrorState`**:
   - Consistent illustrations, explanatory subtitles, and primary action buttons.

---

## 4. State Management Integration (Riverpod + Hooks + Freezed)

### 4.1 Freezed Union Model (`lib/domain/models/ui_state.dart`)

```dart
@freezed
class UiState<T> with _$UiState<T> {
  const factory UiState.initial() = _Initial<T>;
  const factory UiState.loading() = _Loading<T>;
  const factory UiState.success(T data) = _Success<T>;
  const factory UiState.empty([String? message]) = _Empty<T>;
  const factory UiState.error(String message, {int? code}) = _Error<T>;
}
```

### 4.2 Riverpod Providers (`lib/riverpod/`)

* `auth_riverpod_provider.dart` (`authStateProvider`, `currentUserProvider`, `isAuthenticatedProvider`)
* `catalog_riverpod_provider.dart` (`categoriesProvider`, `productsProvider`, `productDetailProvider`)
* `cart_riverpod_provider.dart` (`cartStateProvider`, `cartItemCountProvider`, `cartTotalProvider`)
* `wishlist_riverpod_provider.dart` (`wishlistStateProvider`, `isProductWishlistedProvider`)
* `checkout_riverpod_provider.dart` (`checkoutStateProvider`)
* `orders_riverpod_provider.dart` (`ordersStateProvider`, `orderDetailProvider`)
* `reviews_riverpod_provider.dart` (`productReviewsProvider`, `reviewEligibilityProvider`)

### 4.3 Coexistence with Existing Architecture
* Root `main.dart` wraps `ProviderScope` around `MultiProvider`.
* All existing tests (51 unit & widget tests) pass without regression.
* New features consume modern Riverpod and Flutter Hooks while legacy flows maintain continuous functionality.
