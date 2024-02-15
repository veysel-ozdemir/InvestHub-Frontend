// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/presentation/widgets/app_alert.dart';
import 'package:investhub/route/route_location.dart';
import 'package:investhub/utils/account_type.dart';

class AccountSelectioPage extends ConsumerStatefulWidget {
  const AccountSelectioPage({super.key});

  static AccountSelectioPage builder(
          BuildContext context, GoRouterState state) =>
      const AccountSelectioPage();

  @override
  ConsumerState<AccountSelectioPage> createState() =>
      _AccountSelectioPageState();
}

class _AccountSelectioPageState extends ConsumerState<AccountSelectioPage> {
  var _selectedAccountType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(150),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(250, 90),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  _selectedAccountType == AccountType.investor
                      ? ColorPalette.darkPurple
                      : ColorPalette.lightBlue,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedAccountType = AccountType.investor;
                });
              },
              child: Text(
                "INVESTOR\nACCOUNT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _selectedAccountType == AccountType.investor
                      ? ColorPalette.lightBlue
                      : ColorPalette.darkPurple,
                ),
              ),
            ),
            const Gap(35),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(250, 90),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  _selectedAccountType == AccountType.studentCommunity
                      ? ColorPalette.darkPurple
                      : ColorPalette.lightBlue,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedAccountType = AccountType.studentCommunity;
                });
              },
              child: Text(
                "STUDENT\nCOMMUNITY\nACCOUNT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _selectedAccountType == AccountType.studentCommunity
                      ? ColorPalette.lightBlue
                      : ColorPalette.darkPurple,
                ),
              ),
            ),
            const Gap(35),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(250, 90),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  _selectedAccountType == AccountType.individual
                      ? ColorPalette.darkPurple
                      : ColorPalette.lightBlue,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedAccountType = AccountType.individual;
                });
              },
              child: Text(
                "INDIVIDUAL\nACCOUNT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _selectedAccountType == AccountType.individual
                      ? ColorPalette.lightBlue
                      : ColorPalette.darkPurple,
                ),
              ),
            ),
            const Gap(85),
            ElevatedButton(
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                  Size(250, 60),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  ColorPalette.darkPurple,
                ),
              ),
              onPressed: () {
                if (_selectedAccountType == null) {
                  AppAlert.showAccountSelectionAnimatedDialog(context);
                } else {}
              },
              child: const Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
              onPressed: () {
                if (_selectedAccountType == null) {
                  AppAlert.showAccountSelectionAnimatedDialog(context);
                } else {
                  context.push(
                    RouteLocations.register,
                    extra: _selectedAccountType,
                  );
                }
              },
              child: const Text(
                "REGISTER",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
