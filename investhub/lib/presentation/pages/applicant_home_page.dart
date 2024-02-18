import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/presentation/widgets/app_alert.dart';

class ApplicantHomePage extends ConsumerStatefulWidget {
  const ApplicantHomePage({super.key});

  static ApplicantHomePage builder(BuildContext context, GoRouterState state) =>
      const ApplicantHomePage();

  @override
  ConsumerState<ApplicantHomePage> createState() => _ApplicantHomePageState();
}

class _ApplicantHomePageState extends ConsumerState<ApplicantHomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        actions: [
          IconButton.outlined(
            onPressed: () => AppAlert.showAnimatedDialog(
              context: context,
              message: "Coming soon...",
              backgroundColor: ColorPalette.grey,
              textColor: ColorPalette.black,
            ),
            icon: const Icon(
              Icons.mail,
              color: ColorPalette.white,
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                ColorPalette.black,
              ),
            ),
          ),
          IconButton.outlined(
            onPressed: () => AppAlert.showAnimatedDialog(
              context: context,
              message: "Coming soon...",
              backgroundColor: ColorPalette.grey,
              textColor: ColorPalette.black,
            ),
            icon: const Icon(
              Icons.person,
              color: ColorPalette.white,
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                ColorPalette.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Gap(50),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorPalette.green,
                ),
                child: const Icon(
                  Icons.done,
                  color: ColorPalette.white,
                  size: 75,
                ),
              ),
              const Gap(30),
              const Text(
                "YOUR APPLICATION IS DONE!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPalette.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              const Text(
                "YOUR PROJECT IS WAITING TO BE\nDISCOVERED BY INVESTORS.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPalette.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
