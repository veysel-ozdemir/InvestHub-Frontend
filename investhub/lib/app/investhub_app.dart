import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investhub/provider/route_provider.dart';

class InvestHubApp extends ConsumerWidget {
  const InvestHubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routeConfig,
    );
  }
}
