// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/auth/auth_service.dart';
import 'package:investhub/cloud/cloud_service.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/data/models/individual_model.dart';
import 'package:investhub/data/models/student_community_model.dart';
import 'package:investhub/provider/investor_email_provider.dart';
import 'package:investhub/route/route_location.dart';
import 'package:investhub/utils/extensions.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static LoginPage builder(BuildContext context, GoRouterState state) =>
      const LoginPage();

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
        padding: const EdgeInsets.only(
          bottom: 20,
          top: 20,
          left: 35,
          right: 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(45),
            Container(
              width: deviceSize.width * 0.55,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(45),
                ),
                color: ColorPalette.darkPurple,
              ),
              child: const Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPalette.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "\t\tEMAIL",
                  style: TextStyle(
                    color: ColorPalette.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(
                    color: ColorPalette.darkPurple,
                    fontSize: 18,
                  ),
                  cursorColor: ColorPalette.blue,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
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
              ],
            ),
            const Gap(30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "\t\tPASSWORD",
                  style: TextStyle(
                    color: ColorPalette.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(
                    color: ColorPalette.darkPurple,
                    fontSize: 18,
                  ),
                  cursorColor: ColorPalette.blue,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
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
              ],
            ),
            const Gap(45),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () async {
                    final message = await AuthService().login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if (message!.contains('Success')) {
                      QuerySnapshot querySnapshot;
                      DocumentSnapshot? document;
                      try {
                        querySnapshot = await CloudService()
                            .investors
                            .where('email', isEqualTo: _emailController.text)
                            .get();
                        if (querySnapshot.docs.isNotEmpty) {
                          document = querySnapshot.docs.first;
                          // first way of getting the value of a field of document from database
                          CloudService().investors.doc(document.id).get();
                          final data = document.data() as Map<String, dynamic>;
                          if (data['form_filled'] == true) {
                            ref
                                .read(investorEmailProvider.notifier)
                                .updateEmail(_emailController.text);
                            context.go(RouteLocations.investorHome);
                          } else {
                            context.go(
                              RouteLocations.investorProfile,
                              extra: true,
                            );
                          }
                        } else {
                          querySnapshot = await CloudService()
                              .studentCommunity
                              .where('email', isEqualTo: _emailController.text)
                              .get();
                          if (querySnapshot.docs.isNotEmpty) {
                            document = querySnapshot.docs.first;
                            // second way of getting the value of a field of document from database
                            StudentCommunityModel studentCommunityModel =
                                StudentCommunityModel.fromMap(
                                    document.data() as Map<String, dynamic>);
                            if (studentCommunityModel.formFilled) {
                              context.go(RouteLocations.applicantHome);
                            } else {
                              context
                                  .go(RouteLocations.communityApplicationForm);
                            }
                          } else {
                            querySnapshot = await CloudService()
                                .individuals
                                .where('email',
                                    isEqualTo: _emailController.text)
                                .get();
                            if (querySnapshot.docs.isNotEmpty) {
                              document = querySnapshot.docs.first;
                              IndividualModel individualModel =
                                  IndividualModel.fromMap(
                                      document.data() as Map<String, dynamic>);
                              if (individualModel.formFilled) {
                                context.go(RouteLocations.applicantHome);
                              } else {
                                context
                                    .go(RouteLocations.projectApplicationForm);
                              }
                            } else {
                              document = null;
                            }
                          }
                        }
                        if (document == null) {
                          throw Exception();
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              message,
                              style: const TextStyle(
                                color: ColorPalette.white,
                              ),
                            ),
                            backgroundColor: ColorPalette.darkPurple,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            message,
                            style: const TextStyle(
                              color: ColorPalette.white,
                            ),
                          ),
                          backgroundColor: ColorPalette.darkPurple,
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    side: const MaterialStatePropertyAll(
                      BorderSide(
                        color: ColorPalette.blue,
                      ),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(ColorPalette.white),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 15,
                      ),
                    ),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: ColorPalette.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Gap(20),
                TextButton(
                  onPressed: () async {
                    final message = await AuthService()
                        .resetPassword(email: _emailController.text);
                    if (message!.contains('Success')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Check your mailbox. We have sent you an email to reset the password.",
                            style: TextStyle(
                              color: ColorPalette.white,
                            ),
                          ),
                          backgroundColor: ColorPalette.darkPurple,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _emailController.text.isNotEmpty
                                ? message
                                : "Enter your email first.",
                            style: const TextStyle(
                              color: ColorPalette.white,
                            ),
                          ),
                          backgroundColor: ColorPalette.darkPurple,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "I FORGOT MY PASSWORD?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPalette.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
