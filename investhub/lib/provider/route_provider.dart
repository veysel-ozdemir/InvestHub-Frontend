import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/route/app_routes.dart';
import 'package:investhub/route/route_location.dart';

final routeProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: RouteLocations.start,
    navigatorKey: navigationKey,
    routes: appRoutes,
  ),
);
