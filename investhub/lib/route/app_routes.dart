import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/presentation/pages/account_selection_page.dart';
import 'package:investhub/presentation/pages/start_page.dart';
import 'package:investhub/route/route_location.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocations.start,
    parentNavigatorKey: navigationKey,
    builder: StartPage.builder,
  ),
  GoRoute(
    path: RouteLocations.accountSelection,
    parentNavigatorKey: navigationKey,
    builder: AccountSelectioPage.builder,
  ),
];
