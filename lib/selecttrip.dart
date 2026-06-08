import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:msrtc_demo/domain/entities/trip.dart';
import 'package:msrtc_demo/domain/usecases/get_routes.dart';
import 'package:msrtc_demo/domain/usecases/get_stops_for_route.dart';
import 'package:msrtc_demo/issueticket.dart';

class SelectTrip extends StatefulWidget {
  final GetRoutes getRoutes;
  final GetStopsForRoute getStopsForRoute;

  const SelectTrip({
    super.key,
    required this.getRoutes,
    required this.getStopsForRoute,
  });

  @override
  State<SelectTrip> createState() => _SelectTripState();
}

class _SelectTripState extends State<SelectTrip> {
  late final List<Trip> trips;

  @override
  void initState() {
    super.initState();
    trips = widget.getRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          title: const Text(
            'SELECT TRIP',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => IssueTicket(
                      routeNo: trip.routeNo,
                      getStopsForRoute: widget.getStopsForRoute,
                    ),
                  ),
                );
              },
              child: DottedBorder(
                color: Colors.red,
                strokeWidth: 1,
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sr No : ${index + 1}'),
                          Text(
                            trip.status,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('From Stop :-', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(trip.fromStop, style: const TextStyle(color: Colors.black)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('To Stop :-', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(trip.toStop, style: const TextStyle(color: Colors.black)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Trip No :-', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(trip.tripNo),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Route No :-', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(trip.routeNo, style: const TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Trip Dept Date :-', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(trip.departureDate),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Trip Dept Time :-', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(trip.departureTime, style: const TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Trip Bus Service No :-', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(trip.serviceNo),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Bus Type :-', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(trip.busType, style: const TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
