class Trip {
  final String routeNo;
  final String tripNo;
  final String fromStop;
  final String toStop;
  final String departureDate;
  final String departureTime;
  final String serviceNo;
  final String busType;
  final String status;

  const Trip({
    required this.routeNo,
    required this.tripNo,
    required this.fromStop,
    required this.toStop,
    required this.departureDate,
    required this.departureTime,
    required this.serviceNo,
    required this.busType,
    required this.status,
  });
}
