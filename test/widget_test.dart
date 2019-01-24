import 'package:flutter_test/flutter_test.dart';
import 'package:what_4_lunch/screens/decision_helper_screen.dart';
import 'package:what_4_lunch/what4lunch_app.dart';

void main() {
  testWidgets('Application loads the Home Screen', (WidgetTester tester) async {
    await tester.pumpWidget(What4LunchApp());
    expect(find.byType(DecisionHelperScreen), findsOneWidget);
  });
}
