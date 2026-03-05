
Few additional tools needed provided by the `flutter_test` package:
- The [[WidgetTester]] allows building and interacting with widgets in a test environment.
- The `testWidgets()` function automatically creates a new `WidgetTester` for each test case, and is used in place of the normal `test()` function.
- The `Finder` classes allow searching for widgets in the test environment.
- Widget-specific `Matcher` constants help verify whether a `Finder` locates a widget or multiple widgets in the test environment.


### Notes about the pump() methods

After the initial call to `pumpWidget()`, the `WidgetTester` provides additional ways to rebuild the same widget. This is useful if you're working with a `StatefulWidget` or animations.

For example, tapping a button calls `setState()`, but Flutter won't automatically rebuild your widget in the test environment. Use one of the following methods to ask Flutter to rebuild the widget.

- `tester.pump(Duration duration)`
	Schedules a frame and triggers a rebuild of the widget. If a `Duration` is specified, it advances the clock by that amount and schedules a frame. It does not schedule multiple frames even if the duration is longer than a single frame.

*Note: To kick off the animation, you need to call `pump()` once (with no duration specified) to start the ticker. Without it, the animation does not start.*

- `tester.pumpAndSettle()`
	Repeatedly calls `pump()` with the given duration until there are no longer any frames scheduled. This, essentially, waits for all animations to complete.


### Matcher class examples

- findsOneWidget: Verifies that only one widget is found.
- findsNothing: Verifies that no widgets are found.
- findsWidgets: Verifies that one or more widgets are found.
- findsNWidgets: Verifies that a specific number(N) of widgets are found.
- matchesGoldenFile: Verifies that a widget's rendering matches a particular bitmap image ("golden file" testing).

*Note: Learn about [Matcher](https://pub.dev/packages/matcher)*