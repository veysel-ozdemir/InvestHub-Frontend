import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/route/route_location.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  static StartPage builder(BuildContext context, GoRouterState state) =>
      const StartPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Gap(230),
          const Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text(
                "Find the\ninvestments\nyou need\nwith this application.",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: ColorPalette.darkPurple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Gap(60),
          ElevatedButton(
            onPressed: () => context.go(RouteLocations.accountSelection),
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.all(20),
              ),
              backgroundColor: MaterialStatePropertyAll(
                ColorPalette.darkPurple,
              ),
            ),
            child: const Text(
              "GET STARTED",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
