import 'package:flutter/material.dart';
import 'package:msrtc_demo/homescreen.dart';

import 'data/datasources/local_trip_data_source.dart';
import 'data/repositories/trip_repository_impl.dart';
import 'domain/usecases/get_routes.dart';
import 'domain/usecases/get_stops_for_route.dart';

void main() {
  const repository = TripRepositoryImpl(LocalTripDataSource());
  runApp(const MyApp(
    getRoutes: GetRoutes(repository),
    getStopsForRoute: GetStopsForRoute(repository),
  ));
}

class MyApp extends StatelessWidget {
  final GetRoutes? getRoutes;
  final GetStopsForRoute? getStopsForRoute;

  const MyApp({super.key, this.getRoutes, this.getStopsForRoute});

  @override
  Widget build(BuildContext context) {
    const repository = TripRepositoryImpl(LocalTripDataSource());
    final getRoutes = this.getRoutes ?? const GetRoutes(repository);
    final getStopsForRoute = this.getStopsForRoute ?? const GetStopsForRoute(repository);

    return MaterialApp(
      title: 'MSRTC Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homescreen(
        getRoutes: getRoutes,
        getStopsForRoute: getStopsForRoute,
      ),
    );
  }
}
