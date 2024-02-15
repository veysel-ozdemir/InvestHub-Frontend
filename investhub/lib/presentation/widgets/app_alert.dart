import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/const/color_palette.dart';

class AppAlert {
  const AppAlert._();

  static showAccountSelectionAnimatedDialog(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      title: const Text("Please first select the account type."),
      titleTextStyle: const TextStyle(
        color: ColorPalette.darkPurple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: ColorPalette.lightBlue,
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text(
            "OK",
            style: TextStyle(
              color: ColorPalette.darkPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(
        scale: Tween<double>(
          begin: 0.5,
          end: 1.0,
        ).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(
            begin: 0.5,
            end: 1.0,
          ).animate(animation),
          child: alertDialog,
        ),
      ),
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}
