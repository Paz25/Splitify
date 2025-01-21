import 'package:flutter/material.dart';
import 'package:splitify/const/colors.dart';

AppBar primaryAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
        color: TColors.tertiaryColor,
      ),
    ),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: TColors.tertiaryColor,
      ),
    ),
    centerTitle: true,
    backgroundColor: TColors.secondaryColor,
  );
}
