import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/home_page.dart';

void main() {
  testWidgets(
    'given counter is 0 when increment button is clicked then counter should be 1',
    (tester) async { // async because pumpWidget is of type Future<void> so we need to await
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(
            title: 'Home Page',
          ),
        ),
      );

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      // final incrementBtn = find.byType(FloatingActionButton); // since there is only one FloatingActionButton in the widget tree
      final incrementBtn = find.byKey(const Key('increment_btn')); // better to use key if there are multiple FloatingActionButton in the widget tree
      await tester.tap(incrementBtn); // simulate a tap on the button
      // cant call tester.pumpWidget() here because it will reset the state of the widget
      await tester.pump(); // rebuild the widget after the state has changed

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);

      // to check if title is present
      expect(find.text('Home Page'), findsOneWidget);

      // to check appBar is present
      expect(find.byType(AppBar), findsOneWidget);


    }
  );
}