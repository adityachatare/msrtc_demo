import '../entities/stop.dart';
import '../repositories/trip_repository.dart';

class GetStopsForRoute {
  final TripRepository repository;

  const GetStopsForRoute(this.repository);

  List<Stop> call(String routeNo) => repository.getStopsForRoute(routeNo);
}
