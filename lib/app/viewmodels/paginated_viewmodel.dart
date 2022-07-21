import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';

mixin PaginatedViewModelMixin on ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  final debounceDuration = const Duration(milliseconds: 300);

  /// A convenience method for you to call to load initial data.
  Future<void> loadData();
  Future<void> loadMoreData();

  /// Add this as a listener to your [ScrollController] for when
  /// your [ScrollController.position] has exceeded your specified
  /// offset.
  void onScrollThresholdExceeded() {
    EasyDebounce.debounce(toString(), debounceDuration, () {
      _nextPage();
      loadMoreData();
    });
  }

  Future<void> refreshData() async {
    resetPage();
    await loadData();
  }

  void resetPage() {
    _currentPage = 0;
  }

  void _nextPage() {
    _currentPage++;
  }
}

/// A convenience class that extends the [BaseViewModel] with
/// the [PaginatedViewModelMixin] applied.
abstract class PaginatedViewModel extends BaseViewModel
    with PaginatedViewModelMixin {}
