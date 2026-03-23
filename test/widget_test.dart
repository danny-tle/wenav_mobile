import 'package:flutter_test/flutter_test.dart';
import 'package:wenav_mobile/main.dart';

void main() {
  testWidgets('WeNav app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const WeNavApp());
    expect(find.text('WeNav'), findsOneWidget);
  });
}
