import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:get_it/get_it.dart';

abstract class BaseRepository {
  ApiService get apiService => GetIt.instance<ApiService>();
}
