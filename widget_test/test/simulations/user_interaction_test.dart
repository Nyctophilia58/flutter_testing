import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/simulations/user_interaction.dart';

void main() {
  testWidgets(
    'Add and remove a todo',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UserInteraction(appTitle: 'Todo List')
        )
      );

      // Enter 'hi' into the TextField.
      await tester.enterText(find.byType(TextField), 'Hi');

      // Tap the add button.
      await tester.tap(find.byType(FloatingActionButton));

      // Rebuild the widget after the state has changed
      await tester.pump();
      expect(find.text('Hi'), findsOneWidget);

      // Swipe the item to dismiss it.
      await tester.drag(find.byType(Dismissible), const Offset(500, 0));

      // Build the widget until the dismiss animation ends.
      await tester.pumpAndSettle();

      // Ensure that the item is no longer on screen.
      expect(find.text('hi'), findsNothing);
    }
  );
}