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

  testWidgets('App launches and displays Login page when unauthenticated', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify that the login page elements render
    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Register'), findsOneWidget);
  });
}
