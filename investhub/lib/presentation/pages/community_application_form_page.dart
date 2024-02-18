import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/utils/extensions.dart';

class CommunityApplicationFormPage extends ConsumerStatefulWidget {
  const CommunityApplicationFormPage({super.key});

  static CommunityApplicationFormPage builder(
          BuildContext context, GoRouterState state) =>
      const CommunityApplicationFormPage();

  @override
  ConsumerState<CommunityApplicationFormPage> createState() =>
      _CommunityApplicationFormPageState();
}

class _CommunityApplicationFormPageState
    extends ConsumerState<CommunityApplicationFormPage> {
  final TextEditingController communityPresidentController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController communityNameController = TextEditingController();
  final TextEditingController communityPurposeController =
      TextEditingController();
  final TextEditingController communityActivitiesController =
      TextEditingController();
  final TextEditingController investmentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    communityPresidentController.dispose();
    emailController.dispose();
    phoneController.dispose();
    communityNameController.dispose();
    communityPurposeController.dispose();
    communityActivitiesController.dispose();
    investmentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return Scaffold(
      backgroundColor: ColorPalette.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Gap(30),
              const Text(
                "Application Form\nFor Your\nCommunity",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPalette.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(30),
              SizedBox(
                width: deviceSize.width,
                child: Row(
                  children: [
                    const Text(
                      "Full Name\nof Community\nPresident:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: communityPresidentController,
                        style: const TextStyle(
                          color: ColorPalette.black,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        cursorColor: ColorPalette.black,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: "Community President",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              SizedBox(
                width: deviceSize.width,
                child: Row(
                  children: [
                    const Text(
                      "Email:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        style: const TextStyle(
                          color: ColorPalette.black,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        cursorColor: ColorPalette.black,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: "community@example.com",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              SizedBox(
                width: deviceSize.width,
                child: Row(
                  children: [
                    const Text(
                      "Phone\nNumber:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        style: const TextStyle(
                          color: ColorPalette.black,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        cursorColor: ColorPalette.black,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: "+1 (234) 567-8901",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              SizedBox(
                width: deviceSize.width,
                child: Row(
                  children: [
                    const Text(
                      "Community\nName:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: communityNameController,
                        style: const TextStyle(
                          color: ColorPalette.black,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        cursorColor: ColorPalette.black,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: "GDSC Konya",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              SizedBox(
                width: deviceSize.width,
                child: Row(
                  children: [
                    const Text(
                      "Community\nPurpose:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: communityPurposeController,
                        style: const TextStyle(
                          color: ColorPalette.black,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        cursorColor: ColorPalette.black,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              SizedBox(
                width: deviceSize.width,
                child: Row(
                  children: [
                    const Text(
                      "Community\nActivities:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: communityActivitiesController,
                        style: const TextStyle(
                          color: ColorPalette.black,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        cursorColor: ColorPalette.black,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              SizedBox(
                width: deviceSize.width,
                child: Row(
                  children: [
                    const Text(
                      "Why Are\nYou Looking\nFor An\nInvestment?",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: investmentController,
                        style: const TextStyle(
                          color: ColorPalette.black,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        cursorColor: ColorPalette.black,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              SizedBox(
                width: deviceSize.width,
                child: Row(
                  children: [
                    const Text(
                      "Upload\nProfile Image:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    OutlinedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          BeveledRectangleBorder(),
                        ),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            style: BorderStyle.solid,
                            color: ColorPalette.black,
                          ),
                        ),
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 10,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Upload",
                        style: TextStyle(
                          color: ColorPalette.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      BeveledRectangleBorder(),
                    ),
                    side: MaterialStatePropertyAll(
                      BorderSide(
                        style: BorderStyle.solid,
                        color: ColorPalette.black,
                      ),
                    ),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                    ),
                  ),
                  child: const Text(
                    "SAVE",
                    style: TextStyle(
                      color: ColorPalette.black,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
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
