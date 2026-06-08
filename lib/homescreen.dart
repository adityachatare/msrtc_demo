import 'package:flutter/material.dart';
import 'package:msrtc_demo/domain/usecases/get_routes.dart';
import 'package:msrtc_demo/domain/usecases/get_stops_for_route.dart';
import 'package:msrtc_demo/selecttrip.dart';

class Homescreen extends StatelessWidget {
  final GetRoutes getRoutes;
  final GetStopsForRoute getStopsForRoute;

  const Homescreen({
    super.key,
    required this.getRoutes,
    required this.getStopsForRoute,
  });

  @override
  Widget build(BuildContext context) {
    final trips = getRoutes();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          title: const Text(
            'Select Trip',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Available trips: ${trips.length}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SelectTrip(
                        getRoutes: getRoutes,
                        getStopsForRoute: getStopsForRoute,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'SELECT TRIP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
