import 'package:dio/dio.dart';
import 'package:workshopcodeconflutter/models/hw_collection.dart';

import 'package:workshopcodeconflutter/providers/dio_provider_base.dart';

class MiniCollectionRepository {
  static const String URL_GET_COLLECTIONS = 'GetAllMiniCollection';

  Dio dio = DioProviderBase().dio;

  Future<List<MiniCollection>> get() async {
    final _miniCollections = List<MiniCollection>();

    Response response = await dio.get(URL_GET_COLLECTIONS);

    if (response.statusCode == 200) {
      List.castFrom(response.data).forEach(
        (element) => _miniCollections.add(MiniCollection.fromJson(element)),
      );

      return _miniCollections;
    }

    return null;
  }
}
