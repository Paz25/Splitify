import 'package:flutter/material.dart';
import 'package:splitify/const/colors.dart';

ElevatedButton buttonPrimary({
  Key? key,
  required BuildContext context,
  required String text,
  VoidCallback? onPressed,
}) {
  return ElevatedButton(
    key: key,
    onPressed: () {
      if (onPressed != null) {
        onPressed();
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: TColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(color: TColors.whiteAccent),
    ),
  );
}

ElevatedButton buttonSecondary({
  Key? key,
  required BuildContext context,
  required String text,
  VoidCallback? onPressed,
}) {
  return ElevatedButton(
    key: key,
    onPressed: () {
      if (onPressed != null) {
        onPressed();
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: TColors.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: TColors.whiteAccent,
        fontSize: 12,
      ),
    ),
  );
}

OutlinedButton buttonPrimaryOutline({
  Key? key,
  required BuildContext context,
  required String text,
  VoidCallback? onPressed,
}) {
  return OutlinedButton(
    key: key,
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      side: const BorderSide(
        color: TColors.blueAccent,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: TColors.blueAccent,
      ),
    ),
  );
}
