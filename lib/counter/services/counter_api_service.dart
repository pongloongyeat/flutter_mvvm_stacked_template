import 'package:flutter_mvvm_stacked_template/app/app.dart';

class CounterApiService extends BaseApiService {
  Future<ResponseModel<ExampleDataModel>> fetchYourData() async {
    final response = await callApi(
      HttpRequestType.get,
      // '$baseUrl/path/to/your/api',
      'https://pokeapi.co/api/v2/pokemon/ditto',
    );

    if (!response.hasError && response.hasData) {
      return ResponseModel.success(ExampleDataModel.fromJson(response.data!));
    }

    return ResponseModel.error(response.error);
  }
}
