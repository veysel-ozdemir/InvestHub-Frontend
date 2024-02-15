import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';
import 'package:investhub/presentation/widgets/app_alert.dart';

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
  int _selectedAccount = 0;

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
                  _selectedAccount == 1
                      ? ColorPalette.darkPurple
                      : ColorPalette.lightBlue,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedAccount = 1;
                });
              },
              child: Text(
                "INVESTOR\nACCOUNT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _selectedAccount == 1
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
                  _selectedAccount == 2
                      ? ColorPalette.darkPurple
                      : ColorPalette.lightBlue,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedAccount = 2;
                });
              },
              child: Text(
                "STUDENT\nCOMMUNITY\nACCOUNT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _selectedAccount == 2
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
                  _selectedAccount == 3
                      ? ColorPalette.darkPurple
                      : ColorPalette.lightBlue,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selectedAccount = 3;
                });
              },
              child: Text(
                "INDIVIDUAL\nACCOUNT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _selectedAccount == 3
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
                if (_selectedAccount == 0) {
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
                if (_selectedAccount == 0) {
                  AppAlert.showAccountSelectionAnimatedDialog(context);
                } else {}
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
