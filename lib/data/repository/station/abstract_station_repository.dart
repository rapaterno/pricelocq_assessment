import 'package:pricelocq_assessment/data/model/station.dart';

abstract class AbstractStationRepository {
  List<Station> getStationList({int page = 1, int perPage = 1000});
}
