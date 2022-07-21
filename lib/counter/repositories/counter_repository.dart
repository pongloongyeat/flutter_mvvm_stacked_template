import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:flutter_mvvm_stacked_template/counter/counter.dart';

/// Declare mixins to ensure that if someone else does reuse
/// your repository, they will require the same methods.
mixin CounterRepositoryMixin on BaseRepository {
  Future<ResponseModel<ExampleDataModel>> fetchDitto();
}

/// Your repository can contain methods to call methods from
/// your ApiService that extends the [BaseApiService]. This
/// can be a wrapping around a single method call or it could
/// be composed of multiple method calls which gets stitched
/// into a single class, if needed.
class CounterRepository extends BaseRepository with CounterRepositoryMixin {
  @override
  CounterApiService get apiService => CounterApiService();

  @override
  Future<ResponseModel<ExampleDataModel>> fetchDitto() {
    return apiService.fetchYourData();
  }
}
