import '../../domain/entities/stop.dart';
import '../../domain/entities/trip.dart';
import '../../domain/repositories/trip_repository.dart';
import '../datasources/local_trip_data_source.dart';

class TripRepositoryImpl implements TripRepository {
  final LocalTripDataSource dataSource;

  const TripRepositoryImpl(this.dataSource);

  @override
  List<Stop> getStopsForRoute(String routeNo) {
    return dataSource.getStopsForRoute(routeNo);
  }

  @override
  List<Trip> getTrips() {
    return dataSource.getTrips();
  }
}
