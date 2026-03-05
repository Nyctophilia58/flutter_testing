import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/simulations/scrollable_list.dart';

void main() {
  testWidgets(
    'finds a item in a long list',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScrollableList(
            items: List<String>.generate(10000, (i) => 'Item $i'),
          ),
        )
      );

      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();

      final firstItemFinder = find.text("Item 0");
      expect(firstItemFinder, findsOneWidget);

      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(const ValueKey('item_50_text'));

      // Scroll until the item to be found appears
      await tester.scrollUntilVisible(itemFinder, 500.0, scrollable: listFinder);

      // Verify that the item contains the correct text
      expect(itemFinder, findsOneWidget);
    }
  );
}
