import 'package:flutter_mvvm_stacked_template/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterViewModel tests', () {
    test('CounterViewModel increments on increment()', () {
      final viewModel = CounterViewModel()..initialise();
      final previousValue = viewModel.count;
      viewModel.increment();
      final currentValue = viewModel.count;

      expect(currentValue > previousValue, isTrue);
    });

    test('CounterViewModel decrements on decrement()', () {
      final viewModel = CounterViewModel()..initialise();
      final previousValue = viewModel.count;
      viewModel.decrement();
      final currentValue = viewModel.count;

      expect(currentValue < previousValue, isTrue);
    });
  });
}
