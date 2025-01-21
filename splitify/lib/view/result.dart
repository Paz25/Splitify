import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splitify/component/appbar_component.dart';
import 'package:splitify/component/button_component.dart';
import 'package:splitify/const/colors.dart';
import 'package:splitify/model/people.dart';
import 'package:splitify/routes/routes.dart';
import 'package:splitify/view/home_view.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  List<People> people = allPeople;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: primaryAppBar(context: context, title: 'Split Bill'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ...List.generate(
                  3,
                  (index) => IndividualBillCard(person: people[index]),
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          color: TColors.tertiaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, -2),
              blurRadius: 5,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: buttonPrimaryOutline(
                  context: context,
                  text: 'Download and Share Bill',
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: buttonPrimary(
                  context: context,
                  text: "Save Bill",
                  onPressed: () {
                    // Database logic here
                    Navigator.of(context)
                        .push(createSlideRoute(const HomeView()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class IndividualBillCard extends StatelessWidget {
  final People person;

  const IndividualBillCard({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: TColors.blueAccent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: TColors.blueAccent,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PersonHeader(
                  person: person,
                  image:
                      Image.asset('assets/images/profile_picture/people_1.png'),
                ),
                const Text(
                  'Rp93,525',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: TColors.whiteAccent,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ItemCard(
                  name: 'Salted Egg Pao',
                  individualPrice: 30000,
                  quantity: 2,
                ),
                ItemCard(
                  name: 'Hainan Chicken Rice',
                  individualPrice: 48200,
                  quantity: 1,
                ),
                ItemCard(
                  name: 'Hongkong Fried Rice',
                  individualPrice: 48200,
                  quantity: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonHeader extends StatelessWidget {
  final People person;
  final Image image;

  const PersonHeader({
    super.key,
    required this.person,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: image.image,
          radius: 20,
        ),
        const SizedBox(width: 8),
        Text(
          person.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: TColors.whiteAccent,
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final String name;
  final double individualPrice;
  final int quantity;

  const ItemCard({
    super.key,
    required this.name,
    required this.individualPrice,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: TColors.secondaryColor, width: 1.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            name,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: TColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '@ ${NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: '',
                  decimalDigits: 0,
                ).format(individualPrice)} x $quantity / 4',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: TColors.secondaryColor,
                ),
              ),
              Text(
                NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: 'Rp',
                  decimalDigits: 0,
                ).format(individualPrice * quantity),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: TColors.secondaryColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
