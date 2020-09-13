import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workshopcodeconflutter/models/car.dart';

import '../providers/dio_provider_base.dart';

class CarRepository {
  static const String URL_GET_CARS = "GetCars";
  Dio dio = DioProviderBase().dio;

  Database database;

  Future<List<Car>> get(int collectionId) async {
    final _cars = List<Car>();

    Response response = await dio.post(URL_GET_CARS, data: {});

    if (response.statusCode == 200) {
      List.castFrom(response.data).forEach(
        (element) {
          final car = Car.fromJson(element);

          if (car.collectionId == collectionId) _cars.add(car);
        },
      );

      return _cars;
    }

    return null;
  }
}
