// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/route/route_location.dart';
import 'package:investhub/utils/extensions.dart';

class EntryTypeSelectionPage extends ConsumerStatefulWidget {
  const EntryTypeSelectionPage({super.key});

  static EntryTypeSelectionPage builder(
          BuildContext context, GoRouterState state) =>
      const EntryTypeSelectionPage();

  @override
  ConsumerState<EntryTypeSelectionPage> createState() =>
      _AccountSelectioPageState();
}

class _AccountSelectioPageState extends ConsumerState<EntryTypeSelectionPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Gap(deviceSize.height * 0.45),
              ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(250, 60),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    ColorPalette.darkPurple,
                  ),
                ),
                onPressed: () => context.push(RouteLocations.login),
                child: const Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.white,
                  ),
                ),
              ),
              const Gap(25),
              ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(250, 60),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    ColorPalette.darkPurple,
                  ),
                ),
                onPressed: () => context.push(RouteLocations.register),
                child: const Text(
                  "REGISTER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
