

Testing pyramid:

	``` (expensive and slow)
	Manual Testing 
	E2E
	Integration Testing
	Functional Testing
	Unit Testing
	``` (cheap and fast)


Trade-offs between different kinds of testing:

| Tradeoff             | Unit  | Widget | Integration |
| -------------------- | ----- | ------ | ----------- |
| **Confidence**       | Low   | Higher | Highest     |
| **Maintenance cost** | Low   | Higher | Highest     |
| **Dependencies**     | Few   | More   | Most        |
| **Execution speed**  | Quick | Quick  | Slow        |

The `test` package provides the core functionality for writing tests in Dart. This is the best approach when writing packages consumed by web, server, and Flutter apps.

To add the `test` package as a dev dependency, run `flutter pub add`:

```dart
flutter pub add dev:test
```

To run tests:

```dart
// Run all tests at once
flutter test

// Run particular test file
flutter test test/counter_test.dart

// Run all tests into one group
flutter test --plain-name "Test start, increment, decrement"
```