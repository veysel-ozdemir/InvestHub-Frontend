// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/data/models/individual_model.dart';
import 'package:investhub/utils/extensions.dart';

class ProjectDetailsPage extends ConsumerWidget {
  IndividualModel project;

  ProjectDetailsPage({super.key, required this.project});

  static ProjectDetailsPage builder(
          BuildContext context, GoRouterState state) =>
      ProjectDetailsPage(
        project: state.extra as IndividualModel,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: ColorPalette.blue,
          ),
        ),
        title: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Text(
            project.projectName,
            style: const TextStyle(
              color: ColorPalette.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: deviceSize.height * 0.25,
              width: deviceSize.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorPalette.grey,
              ),
              child: const Icon(
                Icons.image,
                size: 60,
              ),
            ),
            const Gap(20),
            TextFormField(
              scrollPhysics: const AlwaysScrollableScrollPhysics(),
              maxLines: 1,
              style: const TextStyle(
                color: ColorPalette.darkPurple,
                fontSize: 16,
              ),
              cursorColor: ColorPalette.blue,
              readOnly: true,
              initialValue: '${project.name} ${project.surname}',
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                labelText: "Name-Surname:",
                labelStyle: TextStyle(
                  color: ColorPalette.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.blue,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.blue,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
            ),
            const Gap(20),
            TextFormField(
              style: const TextStyle(
                color: ColorPalette.darkPurple,
                fontSize: 16,
              ),
              maxLines: 2,
              cursorColor: ColorPalette.blue,
              readOnly: true,
              initialValue: project.aboutMe,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                labelText: "About Me:",
                labelStyle: TextStyle(
                  color: ColorPalette.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.blue,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.blue,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
            ),
            const Gap(20),
            TextFormField(
              style: const TextStyle(
                color: ColorPalette.darkPurple,
                fontSize: 16,
              ),
              maxLines: 2,
              cursorColor: ColorPalette.blue,
              readOnly: true,
              initialValue: project.projectPurpose,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                labelText: "Purpose of the Project:",
                labelStyle: TextStyle(
                  color: ColorPalette.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.blue,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.blue,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
            ),
            const Gap(20),
            TextFormField(
              style: const TextStyle(
                color: ColorPalette.darkPurple,
                fontSize: 16,
              ),
              maxLines: 2,
              initialValue: project.investment,
              readOnly: true,
              cursorColor: ColorPalette.blue,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                labelText: "Why is Investment Needed?:",
                labelStyle: TextStyle(
                  color: ColorPalette.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.blue,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.blue,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contact Me",
                      style: TextStyle(
                        color: ColorPalette.darkPurple,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: ColorPalette.darkPurple,
                            ),
                            shape: BoxShape.circle,
                            color: ColorPalette.white,
                          ),
                          child: const Icon(
                            Icons.mail,
                            color: ColorPalette.darkPurple,
                          ),
                        ),
                        const Gap(10),
                        SizedBox(
                          width: deviceSize.width * 0.6,
                          child: SelectableText(
                            project.email,
                            style: const TextStyle(
                              color: ColorPalette.darkPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorPalette.darkPurple,
                          ),
                          child: const Icon(
                            Icons.phone,
                            color: ColorPalette.white,
                          ),
                        ),
                        const Gap(10),
                        SizedBox(
                          width: deviceSize.width * 0.6,
                          child: SelectableText(
                            project.phone,
                            style: const TextStyle(
                              color: ColorPalette.darkPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
