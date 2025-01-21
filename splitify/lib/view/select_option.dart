import 'package:flutter/material.dart';
import 'package:splitify/component/appbar_component.dart';
import 'package:splitify/const/colors.dart';
import 'package:splitify/routes/routes.dart';
import 'package:splitify/view/result.dart';
import 'package:splitify/view/split_the_bill.dart';

class SelectOptionView extends StatefulWidget {
  const SelectOptionView({super.key});

  @override
  State<SelectOptionView> createState() => _SelectOptionViewState();
}

class _SelectOptionViewState extends State<SelectOptionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: primaryAppBar(context: context, title: 'Start Splitting Bill'),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print('Pressed Split Evenly');
                  Navigator.of(context)
                      .push(createSlideRoute(const ResultView()));
                },
                child: OptionBox(
                  image: Image.asset(
                    'assets/images/select_option/solo.png',
                    width: 250,
                  ),
                  title: 'Split Evenly',
                  subtitle: 'Split the bill equally among all members',
                  color: TColors.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  print('Pressed Split by Items');
                  Navigator.of(context)
                      .push(createSlideRoute(const SplitBillView()));
                },
                child: OptionBox(
                  image: Image.asset(
                    'assets/images/select_option/ramean.png',
                    width: 250,
                  ),
                  title: 'Split by Items',
                  subtitle:
                      'Split the bill based on the items ordered by each member',
                  color: TColors.blueAccent,
                ),
              ),
            ],
          ),
        ));
  }
}

class OptionBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image image;
  final Color color;

  const OptionBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: image,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
