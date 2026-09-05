# Shoppy UI/UX Redesign Specification — Figma-Quality System

## 1. Design Philosophy
Transform Shoppy from a raw developer prototype into a modern, visually attractive, Figma-grade commercial e-commerce mobile application. Every component strictly follows an atomic design token architecture with rich visual hierarchy, smooth micro-interactions, responsive states, and modern tactile feedback.

## 2. Design System Foundation (`lib/core/theme/`)

### Colors (`app_colors.dart`)
- **Primary Brand**: Indigo (`#4F46E5`), Indigo Dark (`#3730A3`), Indigo Light (`#818CF8`), Indigo 50 (`#EEF2FF`).
- **Slate Neutrals**: 9-step slate scale (`slate50` `#F8FAFC` to `slate900` `#0F172A`).
- **Semantics & Accents**:
  - Success/Emerald: `#10B981`, `#ECFDF5`
  - Warning/Amber: `#F59E0B`, `#FFFBEB`
  - Error/Rose: `#EF4444`, `#FEF2F2`
  - Coral/Wishlist: `#F43F5E`
  - Violet/AI Copilot: `#8B5CF6`, `#F5F3FF`
- **Gradients**: `primaryGradient` (Indigo to Violet), `heroCardGradient` (Dark slate to Indigo), `shimmerGradient` (Neutral light shimmer).

### Typography (`app_typography.dart`)
- Display Large (30px, w800, letter-spacing: -0.6)
- Display Medium (24px, w700, letter-spacing: -0.4)
- Heading Large (20px, w700)
- Heading Small (16px, w600)
- Body Large (15px, w500)
- Body Medium (14px, w400)
- Body Small (13px, w400)
- Caption (12px, w400, color: slate500)
- Label / Overline (11px, w700, uppercase, letter-spacing: 0.8)
- Price Typography: Hero Price (26px, w800), Card Price (16px, w800).

### Elevation, Radii & Spacing
- `app_radius.dart`: xs (4), sm (8), md (12), lg (16), xl (24), full (999).
- `app_spacing.dart`: xxs (4) to huge (64).
- `app_shadows.dart`: subtle card shadow (`0 2px 8px rgba(15,23,42,0.06)`), bottomBar shadow, elevated modal shadow.

## 3. Reusable UI Components (`lib/views/widgets/`)
- `AppButton`: Variants (`primary`, `secondary`, `outline`, `danger`, `text`), animated loading spinner, icon support, full width or fitted.
- `AppTextField`: Polished input fields with floating labels, custom prefix/suffix icons, active border focus states, and validator messages.
- `SkeletonLoader`: Shimmering placeholder bones (`ProductCardSkeleton`, list item skeleton) to eliminate jarring layout shifts.
- `EmptyStateView`: Illustrated vector empty states with headline, supportive subtext, and clear call-to-action button.
- `ErrorStateView`: Friendly failure representation with retry action.
- `ProductCard`: Figma-crafted product card with high-res aspect ratio image, favorite heart toggle with micro-bounce, rating pill, seller brand tag, authoritative price, stock scarcity alert ("Only 3 left"), and instant add-to-cart button.
- `CategorySelector`: Pill chips with active highlight and category icons.
- `CartItemTile`: High-res thumbnail, quantity stepper with tactile haptic controls, unit and line prices, swipe/tap delete.
- `RecommendationCarousel`: AI-driven horizontal carousel showcasing curated and trending products.

## 4. Screen Architecture
- **HomePage**: Brand header with AI Copilot badge, search trigger bar, hero carousel with pagination dots, interactive category pills, AI recommendation rails, and responsive product catalog grid.
- **SearchPage**: Instant search with recent search pills, filter sheet integration (price slider, rating filter, in-stock toggle), and grid/empty results.
- **ProductDetailPage**: Full-bleed gallery, seller verification, stock availability pill, verified customer review distribution, and sticky bottom buy bar.
- **CartPage**: Free shipping progress threshold bar ($100 free shipping goal), cart item steppers, breakdown summary, and sticky checkout CTA.
- **CheckoutPage**: Visual delivery address selector, delivery method tiles (Standard vs Express), payment selector (Card vs COD), authoritative breakdown, and Place Order button.
- **OrderConfirmationPage**: Celebratory checkmark, copyable order reference number, items snapshot, and next actions.
- **ProfilePage**: Avatar with role pill (Admin/Customer), Store Administration link for Admins, order activity hub, and security settings.
