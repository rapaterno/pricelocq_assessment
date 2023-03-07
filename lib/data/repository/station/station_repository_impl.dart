import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/data/repository/station/abstract_station_repository.dart';

class StationRepositoryImpl implements AbstractStationRepository {
  final Dio dio;

  StationRepositoryImpl(this.dio);
  @override
  Future<List<Station>> getStationList(
      {int page = 1, int perPage = 1000}) async {
    final Map<String, dynamic> queryParameters = {
      'page': page,
      'perPage': perPage
    };
    final response =
        await dio.get('/ms-fleet/station', queryParameters: queryParameters);

    final data = response.data['data'];
    final stationsJson = data['stations'] as List;
    final stations =
        stationsJson.map((dynamic) => Station.fromAPIJson(dynamic)).toList();

    return stations;
  }
}
