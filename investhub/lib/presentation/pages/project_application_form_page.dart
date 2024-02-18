import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/utils/extensions.dart';

class ProjectApplicationFormPage extends ConsumerStatefulWidget {
  const ProjectApplicationFormPage({super.key});

  static ProjectApplicationFormPage builder(
          BuildContext context, GoRouterState state) =>
      const ProjectApplicationFormPage();

  @override
  ConsumerState<ProjectApplicationFormPage> createState() =>
      _CommunityApplicationFormPageState();
}

class _CommunityApplicationFormPageState
    extends ConsumerState<ProjectApplicationFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectPurposeController =
      TextEditingController();
  final TextEditingController aboutMeController = TextEditingController();
  final TextEditingController investmentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    projectNameController.dispose();
    projectPurposeController.dispose();
    aboutMeController.dispose();
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
                "Application Form\nFor Your\nProject",
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
                      "Name:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
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
                          hintText: "Your Name",
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
                      "Surname:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: surnameController,
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
                          hintText: "Your Surname",
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
                          hintText: "project@example.com",
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
                      "Project\nName:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: projectNameController,
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
                          hintText: "Tech Innovation",
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
                      "Project\nPurpose:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: projectPurposeController,
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
                      "About Me:",
                      style: TextStyle(
                        color: ColorPalette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: TextFormField(
                        controller: aboutMeController,
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
