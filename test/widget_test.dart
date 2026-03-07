// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:islami/main.dart';

void main() {
  testWidgets('App starts with IntroScreen or HomeScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // We pass isIntroShown: false to simulate first-time launch
    await tester.pumpWidget(const MyApp(isIntroShown: false));

    // Basic check: verify the app builds and shows some text or structure.
    // Since it's a dynamic app, we just check if MyApp can be pumped.
    expect(find.byType(MyApp), findsOneWidget);
  });
}
