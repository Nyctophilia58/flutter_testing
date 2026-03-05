
This class programmatically interacts with widgets and the test environment.

Typically, a test uses `pumpWidget` to load a widget tree (in a manner very similar to how `runApp` works in a Flutter application). Then, methods such as `tap`, `drag`, `enterText`, `fling`, `longPress` etc, can be used to interact with the application. The application runs in a `FakeAsync` zone, which allows time to be stepped forward deliberately; this is done using the `pump` method.

The `expect` function can then be used to examine the state of the application, typically using `Finder`s such as those in the `find` namespace, and `Matcher`s such as `findsOneWidget`.

```dart
testWidgets('MyWidget', (WidgetTester tester) async {
  await tester.pumpWidget(const MyWidget());
  await tester.tap(find.text('Save'));
  await tester.pump(); // allow the application to handle
  await tester.pump(const Duration(seconds: 1)); // skip past the animation
  expect(find.text('Success'), findsOneWidget);
});
```

For convenience, instances of this class (such as the one provided by `testWidgets`) can be used as the `vsync` for `AnimationController` objects.
