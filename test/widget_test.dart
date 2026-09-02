import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopp_app/core/preferences.dart';
import 'package:shopp_app/main.dart';
import 'package:shopp_app/providers/user_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Preferences.init();
  });

  testWidgets('App launches and displays Login page when unauthenticated',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('Login form triggers validation error when submitted empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Login button
    final loginButtonFinder = find.widgetWithText(ElevatedButton, 'Login');
    await tester.tap(loginButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Tapping Register button navigates to Create Account screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    final registerButtonFinder = find.widgetWithText(TextButton, 'Register');
    await tester.tap(registerButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Join Shoppy Today'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));
  });

  testWidgets('App displays HomePage when token exists in storage',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({
      Preferences.keyAccessToken: 'mock_access_token_123',
    });
    await Preferences.init();

    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Shoppy Store'), findsOneWidget);
    expect(find.byIcon(Icons.logout), findsOneWidget);
  });
}
