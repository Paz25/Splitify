import 'package:flutter/material.dart';
import 'package:splitify/utils/theme/theme.dart';
import 'package:splitify/view/home_view.dart';
import 'package:splitify/view/split_the_bill.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splitify',
      theme: TAppTheme.lightTheme,
    );
  }
}
