import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:widget_test/animation_example/animation_screen.dart';

void main() {
  group('AnimationScreen Widget Tests', () {
    testWidgets(
      'All together - ',
          (WidgetTester tester) async {
        // Build the AnimationScreen widget.
        await tester.pumpWidget(const MaterialApp(home: AnimationScreen()));

        // Verify the initial state of the animated container.
        final containerFinder = find.byType(Container);
        expect(containerFinder, findsOneWidget);

        // Verify initial properties of the container.
        // final container = tester.widget(containerFinder); // Gets the Widget container
        final container = tester.widget<Container>(containerFinder); // Gets the actual Container container

        // Can't access width directly, need to access constraints and since it can be null, we use ! operator
        expect(container.constraints!.maxWidth, 50);
        expect(container.constraints!.maxHeight, 50);

        // Check the decoration type
        expect(container.decoration, isA<BoxDecoration>());

        // Check the border radius and color from the decoration
        final boxDecoration = container.decoration as BoxDecoration;
        expect(boxDecoration.color, Colors.blue);
        // expect(boxDecoration.borderRadius, BorderRadius.circular(0.0));
        expect(boxDecoration.borderRadius, BorderRadius.zero);

        // trigger a frame
        await tester.pumpAndSettle();

        // again check the properties after a frame
        final updatedContainerFinder = find.byType(Container);
        expect(updatedContainerFinder, findsOneWidget);
        final updatedContainer = tester.widget<Container>(updatedContainerFinder);
        expect(updatedContainer.constraints!.maxWidth, greaterThan(50));
        expect(updatedContainer.constraints!.maxHeight, greaterThan(50));
        expect(updatedContainer.decoration, isA<BoxDecoration>());
        final updatedBoxDecoration = updatedContainer.decoration as BoxDecoration;
        expect(updatedBoxDecoration.color, isNot(Colors.blue));
        expect(updatedBoxDecoration.borderRadius, isNot(BorderRadius.zero));

      }
    );

    testWidgets(
      'Initial - ',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: AnimationScreen()));
        final containerFinder = find.byType(Container);
        expect(containerFinder, findsOneWidget);
        final container = tester.widget<Container>(containerFinder);
        expect(container.constraints!.maxWidth, 50);
        expect(container.constraints!.maxHeight, 50);
       expect(container.decoration, isA<BoxDecoration>());
        final boxDecoration = container.decoration as BoxDecoration;
        expect(boxDecoration.color, Colors.blue);
        expect(boxDecoration.borderRadius, BorderRadius.circular(0.0));
      }
    );

    testWidgets(
      'Final - ',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: AnimationScreen()));
        await tester.pumpAndSettle(const Duration(seconds: 3));
        final containerFinder = find.byType(Container);
        expect(containerFinder, findsOneWidget);
        final container = tester.widget<Container>(containerFinder);
        expect(container.constraints!.maxWidth, 200);
        expect(container.constraints!.maxHeight, 200);
        expect(container.decoration, isA<BoxDecoration>());
        final boxDecoration = container.decoration as BoxDecoration;
        expect(boxDecoration.color, Colors.green);
        expect(boxDecoration.borderRadius, BorderRadius.circular(50.0));
      }
    );
  });
}