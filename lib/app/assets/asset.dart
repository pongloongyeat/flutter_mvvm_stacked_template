import 'package:flutter/widgets.dart';

/// A simple class to access an asset's name, path and size.
class Asset {
  Asset({
    required this.name,
    required this.path,
    required this.size,
  });

  final String name;
  final String path;
  final Size size;
}
