import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/presentation/widgets/app_alert.dart';
import 'package:investhub/route/route_location.dart';
import 'package:investhub/utils/account_type.dart';
import 'package:investhub/utils/extensions.dart';

class RegisterPage extends ConsumerStatefulWidget {
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
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AccountType? _accountType;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _surnameController.dispose();
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
            const Gap(30),
            Container(
              width: deviceSize.width * 0.6,
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
                  color: ColorPalette.white,
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
                  "\t\tACCOUNT TYPE",
                  style: TextStyle(
                    color: ColorPalette.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        color: ColorPalette.darkPurple,
                        fontSize: 18,
                      ),
                      hintText: "-- Select Type --",
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
                    alignment: Alignment.centerLeft,
                    iconEnabledColor: ColorPalette.blue,
                    iconSize: 30,
                    style: const TextStyle(
                      color: ColorPalette.darkPurple,
                      fontSize: 18,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    dropdownColor: ColorPalette.lightBlue,
                    items: [
                      DropdownMenuItem(
                        value: AccountType.investor,
                        child: Text(
                          AccountType.investor.name,
                          style: const TextStyle(
                            color: ColorPalette.darkPurple,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: AccountType.studentCommunity,
                        child: Text(
                          AccountType.studentCommunity.name,
                          style: const TextStyle(
                            color: ColorPalette.darkPurple,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: AccountType.individual,
                        child: Text(
                          AccountType.individual.name,
                          style: const TextStyle(
                            color: ColorPalette.darkPurple,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                    value: _accountType,
                    onChanged: (value) {
                      setState(() {
                        _accountType = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Gap(10),
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
            const Gap(10),
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
            const Gap(10),
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
            const Gap(10),
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
            const Gap(10),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    if (_accountType == null) {
                      AppAlert.showAnimatedDialog(
                        context: context,
                        message: "Please select the account type first.",
                        backgroundColor: ColorPalette.lightBlue,
                        textColor: ColorPalette.darkPurple,
                      );
                    } else if (_accountType == AccountType.studentCommunity) {
                      context.go(RouteLocations.communityApplicationForm);
                    } else if (_accountType == AccountType.individual) {
                      context.go(RouteLocations.projectApplicationForm);
                    } else {
                      //
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
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                  ),
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
                  onPressed: () => context.push(RouteLocations.login),
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
    );
  }
}
