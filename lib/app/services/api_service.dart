import 'package:flutter_mvvm_stacked_template/app/app.dart';

class ApiService extends BaseApiService {
  ApiService();

  Future<ResponseModel<ExampleDataModel>> fetchYourData() async {
    final response = await callApi(
      HttpRequestType.get,
      // '$baseUrl/path/to/refresh/token/endpoint',
      'https://pokeapi.co/api/v2/pokemon/ditto',
    );

    if (!response.hasError && response.hasData) {
      return ResponseModel(
        data: ExampleDataModel.fromJson(response.data!),
        status: response.status,
      );
    }

    return ResponseModel.error(response.error);
  }
}
