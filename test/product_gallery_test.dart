import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopp_app/core/theme/app_icons.dart';
import 'package:shopp_app/core/widgets/app_icon.dart';
import 'package:shopp_app/features/catalog/data/models/product_media_model.dart';
import 'package:shopp_app/features/catalog/data/models/product_model.dart';
import 'package:shopp_app/features/catalog/presentation/widgets/product_media_gallery.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const mockProduct = Product(
    id: 'prod_gallery_test',
    productName: 'Aura Studio Wireless Headphones',
    price: 14999,
    productImage: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
    images: [
      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
      'https://images.unsplash.com/photo-1484704849700-f032a568e944',
      'https://images.unsplash.com/photo-1546435770-a3e426bf472b',
    ],
    media: [
      ProductMedia(
        id: 'm1',
        type: ProductMediaType.image,
        url: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
      ),
      ProductMedia(
        id: 'm2',
        type: ProductMediaType.image,
        url: 'https://images.unsplash.com/photo-1484704849700-f032a568e944',
      ),
      ProductMedia(
        id: 'm3',
        type: ProductMediaType.image,
        url: 'https://images.unsplash.com/photo-1546435770-a3e426bf472b',
      ),
    ],
  );

  group('ProductFullscreenGalleryPage Tests', () {
    testWidgets(
        'renders fullscreen gallery with zero overflow on constrained screen',
        (WidgetTester tester) async {
      // Simulate small mobile device screen (e.g. 360 x 640)
      tester.view.physicalSize = const Size(360, 640);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        MaterialApp(
          home: ProductFullscreenGalleryPage(
            product: mockProduct,
            mediaList: mockProduct.media,
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      // Check header items
      expect(find.text('Aura Studio Wireless Headphones'), findsOneWidget);
      expect(find.text('1 of 3'), findsOneWidget);
      expect(find.text('PHOTO'), findsOneWidget);

      // Verify close icon is rendered
      expect(
        find.byWidgetPredicate(
          (widget) => widget is AppIcon && widget.assetPath == AppIcons.close,
        ),
        findsOneWidget,
      );

      // Verify PageView is rendered for main viewport
      expect(find.byType(PageView), findsOneWidget);

      // Verify thumbnail strip is rendered with 3 items
      expect(find.byType(ListView), findsOneWidget);

      // Verify no overflow exception was thrown
      expect(tester.takeException(), isNull);
    });

    testWidgets('honors initialIndex when opening gallery',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProductFullscreenGalleryPage(
            product: mockProduct,
            mediaList: mockProduct.media,
            initialIndex: 2,
          ),
        ),
      );
      await tester.pump();

      // Should indicate 3 of 3
      expect(find.text('3 of 3'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('tapping thumbnail switches active image',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProductFullscreenGalleryPage(
            product: mockProduct,
            mediaList: mockProduct.media,
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('1 of 3'), findsOneWidget);

      // Find thumbnail items in ListView
      final gestureDetectors = find.descendant(
        of: find.byType(ListView),
        matching: find.byType(GestureDetector),
      );

      // Tap the second thumbnail
      await tester.tap(gestureDetectors.at(1));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.text('2 of 3'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('tapping close button pops the gallery page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProductFullscreenGalleryPage(
                        product: mockProduct,
                        mediaList: mockProduct.media,
                        initialIndex: 0,
                      ),
                    ),
                  );
                },
                child: const Text('Open Gallery'),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Open Gallery'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(ProductFullscreenGalleryPage), findsOneWidget);

      final closeButton = find.byWidgetPredicate(
        (widget) => widget is AppIcon && widget.assetPath == AppIcons.close,
      );
      await tester.tap(closeButton);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(ProductFullscreenGalleryPage), findsNothing);
      expect(find.text('Open Gallery'), findsOneWidget);
    });

    testWidgets('inline ProductMediaGallery taps open fullscreen gallery page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductMediaGallery(
              product: mockProduct,
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ProductMediaGallery), findsOneWidget);

      // Tap fullscreen icon button
      final fullscreenIcon = find.byWidgetPredicate(
        (widget) =>
            widget is AppIcon && widget.assetPath == AppIcons.fullscreen,
      );
      expect(fullscreenIcon, findsOneWidget);

      await tester.tap(fullscreenIcon);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      // Should now have navigated to ProductFullscreenGalleryPage
      expect(find.byType(ProductFullscreenGalleryPage), findsOneWidget);
      expect(find.text('1 of 3'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
