import 'package:flutter_test/flutter_test.dart';
import 'package:quickbite_app/main.dart';

void main() {
  testWidgets('QuickBite splash screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const QuickBiteApp());

    // Verify that QuickBite splash text is present initially.
    expect(find.text('QuickBite'), findsOneWidget);
    expect(find.text('Campus Food Ordering'), findsOneWidget);

    // Advance time past the splash timer (3 seconds) to avoid pending timer.
    await tester.pumpAndSettle(const Duration(seconds: 4));
  });
}
