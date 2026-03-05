
A **unit test** tests a single function, method, or class. The goal of a unit test is to verify the correctness of a unit of logic under a variety of conditions.

External dependencies of the unit under test are generally **mocked out**. Unit tests generally don't read from or write to disk, render to screen, or receive user actions from outside the process running the test.

Typically a unit test consists of three parts:
1. Initialization (Arrange) -  Set up test conditions
     - Pre Tests
     - Post Tests
2. Execution (Act) - Execute the code being tested
3. Observation (Assert) - Verify the result

#### Pre Tests

```dart
// Pretests
setUp(() {
  counter = Counter();
}) ; // Initialize resources before each test

setUpAll((){
  counter = Counter();

}); // Initialize resources before all tests
```

#### Post Tests

```dart
// Post tests
tearDown(() {}); // Clean up resources after each test

tearDownAll(() {}); // Clean up resources after all tests
```


### Mock dependencies

Sometimes, unit tests might depend on classes that fetch data from live web services or databases. This is inconvenient for a few reasons:

- Calling live services or databases slows down test execution.
- A passing test might start failing if a web service or database returns unexpected results. This is known as a "flaky test."
- It is difficult to test all possible success and failure scenarios by using a live web service or database.

Therefore, rather than relying on a live web service or database, you can "mock" these dependencies. Mocks allow emulating a live web service or database and return specific results depending on the situation.


Difference between Mockito and MockTail package:

| Package  | When() syntax                       | Why                                                       |
| -------- | ----------------------------------- | --------------------------------------------------------- |
| Mockito  | when(mockHttpClient.get(...))<br>   | Uses Dart's method interception magic - no wrapper needed |
| MockTail | when(() => mockHttpClient.get(...)) | Requires a callback to capture the method call safely     |
*MockTail wraps the call in () => ... because it uses a safer approach that avoids some of Mockito's limitations (like issues with noSuchMethod and operator overloading).*
