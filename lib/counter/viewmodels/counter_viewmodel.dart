import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:flutter_mvvm_stacked_template/counter/counter.dart';

mixin CounterViewModelMixin on BaseViewModel {
  bool isApiLoading = false;

  /// Strictly speaking, it is recommended to initialise the
  /// variable whenever possible instead of marking it as late
  /// to prevent uninitialised accesses but it's marked as late
  /// here to show the [initialise] override.
  late int count;

  final repository = CounterRepository();

  void increment();
  void decrement();
  Future<void> callApi();
}

class CounterViewModel extends BaseViewModel with CounterViewModelMixin {
  CounterViewModel();

  @override
  void initialise() {
    count = 0;
  }

  @override
  void increment() {
    count++;
    notifyListeners();
  }

  @override
  void decrement() {
    count--;
    notifyListeners();
  }

  @override
  Future<void> callApi() async {
    isApiLoading = true;
    notifyListeners();

    final response = await repository.fetchDitto();

    isApiLoading = false;
    notifyListeners();

    final data = response.data;

    // await showPlatformDialog(
    //   title: 'Data',
    //   content: data?.toJson().toString() ?? 'Null data',
    // );
  }
}
