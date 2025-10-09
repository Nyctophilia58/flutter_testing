import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/counter.dart';

void main() {
  late Counter counter;
  // Pretests
  // setUp(() {
  //   counter = Counter();
  // }) ; // Initialize resources before each test
  setUpAll((){
    counter = Counter();
  }); // Initialize resources before all tests

  // Testing
  group('Counter Class - ', () {
    test('initial value is 0', () {
      expect(counter.count, 0);
    });

    test('incrementCounter increases value by 1', () {
      counter.incrementCounter();
      expect(counter.count, 1);
    });

    test('decrementCounter decreases value by 1', () {
      counter.decrementCounter();
      expect(counter.count, 0);
    });

    test('resetCounter sets value back to 0', () {
      counter.resetCounter();
      expect(counter.count, 0);
    });
  });

  // Post tests
  // tearDown(() {}); // Clean up resources after each test
  // tearDownAll((){}); => null; // Clean up resources after all tests
}