import 'package:car_api_challenge/app/models/car_model.dart';
import 'package:car_api_challenge/data/cars_mock.dart';
import 'package:dio/dio.dart';

class ExternalRepository {
  final Dio _client;

  ExternalRepository(this._client);

  Future<List<CarModel>> getCars() async {
    //final json = await _client.get('url');
    List<Map<String, dynamic>> cars = json['cars'] as List;

    return cars.map((json) => CarModel.fromJson(json)).toList();
  }
}
