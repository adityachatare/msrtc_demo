import '../../domain/entities/trip.dart';

class TripModel extends Trip {
  const TripModel({
    required String routeNo,
    required String tripNo,
    required String fromStop,
    required String toStop,
    required String departureDate,
    required String departureTime,
    required String serviceNo,
    required String busType,
    required String status,
  }) : super(
          routeNo: routeNo,
          tripNo: tripNo,
          fromStop: fromStop,
          toStop: toStop,
          departureDate: departureDate,
          departureTime: departureTime,
          serviceNo: serviceNo,
          busType: busType,
          status: status,
        );
}
