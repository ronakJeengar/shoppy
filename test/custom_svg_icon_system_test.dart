import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopp_app/core/icons/icons.dart';

void main() {
  group('Custom SVG Icon System - Architecture & Asset Verification', () {
    test('All AppIcons constants map to existing SVG files on disk', () {
      final iconPaths = [
        // Navigation
        AppIcons.home,
        AppIcons.homeFilled,
        AppIcons.categories,
        AppIcons.search,
        AppIcons.searchFilled,
        AppIcons.searchTune,
        AppIcons.cart,
        AppIcons.cartFilled,
        AppIcons.wishlist,
        AppIcons.wishlistFilled,
        AppIcons.profile,
        AppIcons.profileFilled,
        AppIcons.menu,
        AppIcons.back,
        AppIcons.arrowBack,
        AppIcons.forward,
        AppIcons.arrowForward,
        AppIcons.chevronDown,
        AppIcons.chevronUp,
        AppIcons.chevronLeft,
        AppIcons.chevronRight,
        AppIcons.close,

        // Commerce
        AppIcons.addToCart,
        AppIcons.buyNow,
        AppIcons.priceTag,
        AppIcons.tag,
        AppIcons.discount,
        AppIcons.coupon,
        AppIcons.gift,
        AppIcons.shoppingBag,
        AppIcons.shoppingBagFilled,
        AppIcons.bag,
        AppIcons.bagFilled,
        AppIcons.wallet,
        AppIcons.payment,
        AppIcons.creditCard,
        AppIcons.cash,
        AppIcons.store,
        AppIcons.deliveryTruck,
        AppIcons.shipping,
        AppIcons.dollar,

        // Product
        AppIcons.favorite,
        AppIcons.favoriteFilled,
        AppIcons.zoom,
        AppIcons.mute,
        AppIcons.volume,

        // Orders
        AppIcons.order,
        AppIcons.orders,
        AppIcons.package,
        AppIcons.processing,
        AppIcons.confirmed,
        AppIcons.shipped,
        AppIcons.outForDelivery,
        AppIcons.delivered,
        AppIcons.cancelled,
        AppIcons.returnOrder,
        AppIcons.returnAction,
        AppIcons.refund,
        AppIcons.trackOrder,
        AppIcons.invoice,

        // Account
        AppIcons.user,
        AppIcons.userAdd,
        AppIcons.edit,
        AppIcons.settings,
        AppIcons.logout,
        AppIcons.login,
        AppIcons.address,
        AppIcons.addressAdd,
        AppIcons.location,
        AppIcons.locationOff,
        AppIcons.phone,
        AppIcons.email,
        AppIcons.lock,
        AppIcons.lockClock,
        AppIcons.lockReset,
        AppIcons.security,
        AppIcons.shield,
        AppIcons.notifications,
        AppIcons.notificationsFilled,
        AppIcons.notificationsOff,

        // Actions
        AppIcons.plus,
        AppIcons.add,
        AppIcons.minus,
        AppIcons.remove,
        AppIcons.delete,
        AppIcons.deleteSweep,
        AppIcons.refresh,
        AppIcons.filter,
        AppIcons.sort,
        AppIcons.check,
        AppIcons.checkAll,
        AppIcons.copy,
        AppIcons.share,
        AppIcons.more,
        AppIcons.moreVert,
        AppIcons.tune,
        AppIcons.eye,
        AppIcons.eyeOff,
        AppIcons.send,
        AppIcons.sparkles,
        AppIcons.touch,
        AppIcons.openInNew,
        AppIcons.arrowNorthWest,

        // Status
        AppIcons.checkCircle,
        AppIcons.checkCircleOutline,
        AppIcons.error,
        AppIcons.errorOutline,
        AppIcons.warning,
        AppIcons.info,
        AppIcons.clock,
        AppIcons.cancel,
        AppIcons.verified,
        AppIcons.verifiedOutline,
        AppIcons.star,
        AppIcons.starHalf,
        AppIcons.starEmpty,
        AppIcons.trending,
        AppIcons.cloudOff,
        AppIcons.maintenance,
        AppIcons.systemUpdate,

        // Notifications
        AppIcons.notification,
        AppIcons.notificationFilled,
        AppIcons.bell,
        AppIcons.success,
        AppIcons.alert,

        // Media
        AppIcons.camera,
        AppIcons.image,
        AppIcons.imageOff,
        AppIcons.video,
        AppIcons.videoOff,
        AppIcons.model3d,
        AppIcons.play,
        AppIcons.pause,
        AppIcons.volumeUp,
        AppIcons.volumeOff,
        AppIcons.fullscreen,
        AppIcons.rotate360,
        AppIcons.rateReview,
        AppIcons.chatBubble,
        AppIcons.commentAdd,

        // Filters
        AppIcons.filterList,
        AppIcons.checkBox,
        AppIcons.checkBoxBlank,
        AppIcons.radioButton,
        AppIcons.radioButtonBlank,
        AppIcons.searchOff,

        // Admin & Domain
        AppIcons.dashboard,
        AppIcons.products,
        AppIcons.users,
        AppIcons.reviews,
        AppIcons.auditLogs,
        AppIcons.analytics,
        AppIcons.category,
        AppIcons.clothing,
        AppIcons.electronics,
        AppIcons.furniture,
        AppIcons.books,
        AppIcons.beauty,
        AppIcons.sports,
      ];

      for (final assetPath in iconPaths) {
        final file = File(assetPath);
        expect(file.existsSync(), isTrue,
            reason: 'Icon file not found: $assetPath');
        final content = file.readAsStringSync();
        expect(content.contains('<svg'), isTrue,
            reason: 'Invalid SVG content: $assetPath');
        expect(content.contains('viewBox='), isTrue,
            reason: 'SVG missing viewBox: $assetPath');
      }
    });

    test('AppIconSizes provides all required semantic and base dimensions', () {
      expect(AppIconSizes.xs, 12.0);
      expect(AppIconSizes.small, 16.0);
      expect(AppIconSizes.medium, 20.0);
      expect(AppIconSizes.large, 24.0);
      expect(AppIconSizes.xl, 28.0);
      expect(AppIconSizes.xxl, 32.0);
      expect(AppIconSizes.hero, 48.0);
      expect(AppIconSizes.emptyState, 64.0);

      // Semantic aliases
      expect(AppIconSizes.button, AppIconSizes.small);
      expect(AppIconSizes.navigation, AppIconSizes.large);
      expect(AppIconSizes.productAction, AppIconSizes.small);
      expect(AppIconSizes.action, 18.0);
      expect(AppIconSizes.rating, 14.0);
      expect(AppIconSizes.display, 36.0);
    });

    testWidgets('AppIcon renders SvgPicture with proper size and semantic label',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon(
              AppIcons.cart,
              size: AppIconSizes.medium,
              semanticLabel: 'Shopping Cart',
            ),
          ),
        ),
      );

      final svgFinder = find.byType(SvgPicture);
      expect(svgFinder, findsOneWidget);
      final svg = tester.widget<SvgPicture>(svgFinder);
      expect(svg.width, AppIconSizes.medium);
      expect(svg.height, AppIconSizes.medium);
      expect(svg.semanticsLabel, 'Shopping Cart');
    });

    testWidgets('AppIcon.navigation constructor uses navigation size',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon.navigation(AppIcons.home),
          ),
        ),
      );

      final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svg.width, AppIconSizes.navigation);
      expect(svg.height, AppIconSizes.navigation);
    });

    testWidgets('AppIcon.button constructor uses button size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon.button(AppIcons.addToCart),
          ),
        ),
      );

      final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svg.width, AppIconSizes.button);
      expect(svg.height, AppIconSizes.button);
    });

    testWidgets('AppIcon with isDecorative=true sets excludeFromSemantics',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppIcon(
              AppIcons.star,
              isDecorative: true,
            ),
          ),
        ),
      );

      final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svg.excludeFromSemantics, isTrue);
    });

    testWidgets('AppIcon respects light and dark theme brightness',
        (tester) async {
      // Light theme
      await tester.pumpWidget(
        Theme(
          data: ThemeData.light(),
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: AppIcon(AppIcons.search),
          ),
        ),
      );
      expect(find.byType(SvgPicture), findsOneWidget);

      // Dark theme
      await tester.pumpWidget(
        Theme(
          data: ThemeData.dark(),
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: AppIcon(AppIcons.search),
          ),
        ),
      );
      expect(find.byType(SvgPicture), findsOneWidget);
    });

    test('Zero Flutter Material or Cupertino icons used in lib/', () {
      final libDir = Directory('lib');
      final forbiddenRegex = RegExp(r'\b(Icons\.|CupertinoIcons\.|IconData\b|Icon\()');

      for (final file in libDir.listSync(recursive: true)) {
        if (file is File && file.path.endsWith('.dart')) {
          final content = file.readAsStringSync();
          final match = forbiddenRegex.firstMatch(content);
          expect(match, isNull,
              reason: 'Forbidden icon usage in ${file.path}: ${match?.group(0)}');
        }
      }
    });
  });
}
