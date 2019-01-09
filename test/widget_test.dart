import 'package:flutter_test/flutter_test.dart';
import 'package:what_4_lunch/what4lunch_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(What4LunchApp());
    // Verify that our counter starts at 0.
    expect(find.text('What'), findsOneWidget);
  });
}
