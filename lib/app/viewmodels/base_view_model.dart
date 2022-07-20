import 'package:stacked/stacked.dart' as stacked;

/// Override the BaseViewModel used in [stacked.BaseViewModel]
/// to inherit some generic functionality we want to provide
/// for all screens.
abstract class BaseViewModel extends stacked.BaseViewModel {
  /// An initialisation method. This does nothing internally.
  void initialise();
}
