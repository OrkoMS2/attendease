import 'package:attendease/main.dart';
import 'package:attendease/src/theme/controller/theme_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';


class DummyThemeController extends ThemeController {
  @override
  bool getThemeFromHiveBox() {
    return false;
  }
  @override
  Future<Locale> getLocale() async => const Locale('en', 'US');
}

void main() {
  testWidgets('App loads without crashing', (WidgetTester tester) async {
    final dummyController = DummyThemeController();

    await tester.pumpWidget(
      AttendEase(
        locale: const Locale('en', 'US'),
        themeController: dummyController,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(MaterialApp), findsOneWidget); // or splash screen, etc.
  });
}
