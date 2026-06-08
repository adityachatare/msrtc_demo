import '../entities/trip.dart';
import '../repositories/trip_repository.dart';

class GetRoutes {
  final TripRepository repository;

  const GetRoutes(this.repository);

  List<Trip> call() => repository.getTrips();
}
