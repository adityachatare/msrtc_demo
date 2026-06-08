import '../entities/stop.dart';
import '../entities/trip.dart';

abstract class TripRepository {
  List<Trip> getTrips();
  List<Stop> getStopsForRoute(String routeNo);
}
