import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/utils/account_type.dart';

class RegisterPage extends StatefulWidget {
  final AccountType? accountType;
  const RegisterPage({
    super.key,
    required this.accountType,
  });

  static RegisterPage builder(BuildContext context, GoRouterState state) =>
      RegisterPage(
        accountType: state.extra as AccountType?,
      );

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            top: 20,
            left: 35,
            right: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              Container(
                width: 300,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                  color: ColorPalette.darkPurple,
                ),
                child: const Text(
                  "CREATE AN\nACCOUNT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "\t\tNAME",
                    style: TextStyle(
                      color: ColorPalette.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _nameController,
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
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "\t\tSURNAME",
                    style: TextStyle(
                      color: ColorPalette.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: _surnameController,
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
              const Gap(20),
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
              const Gap(20),
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
              const Gap(20),
              Column(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        side: const MaterialStatePropertyAll(
                          BorderSide(
                            color: ColorPalette.blue,
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                        )),
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(
                        color: ColorPalette.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Gap(10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "DO YOU ALREADY HAVE AN ACCOUNT?",
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
      ),
    );
  }
}
