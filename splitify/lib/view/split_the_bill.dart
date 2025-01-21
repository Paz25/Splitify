import 'package:flutter/material.dart';

import 'package:splitify/component/appbar_component.dart';
import 'package:splitify/component/button_component.dart';
import 'package:splitify/const/colors.dart';
import 'package:splitify/model/order_item.dart';
import 'package:splitify/model/people.dart';
import 'package:splitify/routes/routes.dart';
import 'package:splitify/view/result.dart';

final allOrderItems = [
  OrderItem(
    name: 'Salted Egg Pao',
    price: 30000,
    quantity: 6,
  ),
  OrderItem(
    name: 'Hainan Chicken Rice',
    price: 48200,
    quantity: 2,
    discount: 4000,
  ),
  OrderItem(
    name: 'Hongkong Fried Rice',
    price: 48200,
    quantity: 1,
    discount: 2000,
  ),
  OrderItem(
    name: 'Wonton Spicy Noodle Soup',
    price: 39500,
    quantity: 1,
  ),
  OrderItem(
    name: 'Iced Tea',
    price: 4000,
    quantity: 4,
  ),
];

class SplitBillView extends StatefulWidget {
  const SplitBillView({super.key});

  @override
  State<SplitBillView> createState() => _SplitBillViewState();
}

class _SplitBillViewState extends State<SplitBillView> {
  List<People> people = allPeople;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: primaryAppBar(context: context, title: 'Split by Items'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Tap the member’s icon to set the items.',
                  style: TextStyle(
                    fontSize: 16,
                    color: TColors.secondaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(people.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: PersonIcon(
                          person: people[index],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: people
                      .map(
                        (person) {
                          return DetailsCard(person: person);
                        },
                      )
                      .toList()
                      .expand(
                        (element) => [
                          element,
                          const SizedBox(height: 16),
                        ],
                      )
                      .toList(),
                ),
                const SizedBox(height: 108),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '5 Items',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Total: Rp374,100',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: buttonPrimary(
                  context: context,
                  text: "Start Splitting Bill",
                  onPressed: () {
                    Navigator.of(context)
                        .push(createSlideRoute(const ResultView()));
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

class DetailsCard extends StatelessWidget {
  final People person;

  const DetailsCard({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: TColors.blueAccent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: TColors.blueAccent,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(person.imagePath),
                      radius: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      person.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: TColors.whiteAccent,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Rp110,200',
                  style: TextStyle(
                    fontSize: 16,
                    color: TColors.whiteAccent,
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
              top: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (person.orderItem != null && person.orderItem!.isNotEmpty)
                  ...person.orderItem!
                      .map((orderItem) => ItemDetailRow(orderItem: orderItem)),
                if (person.orderItem == null || person.orderItem!.isEmpty)
                  const Text('No items ordered.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDetailRow extends StatelessWidget {
  final OrderItem orderItem;

  const ItemDetailRow({
    super.key,
    required this.orderItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: TColors.blueAccent, width: 1),
        ),
      ),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: TColors.blueAccent,
      //     width: 2,
      //   ),
      //   borderRadius: BorderRadius.circular(12),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            orderItem.name,
            style: const TextStyle(
              fontSize: 16,
              color: TColors.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '@ ${orderItem.price}  x  ${orderItem.quantity}',
                style: const TextStyle(
                  fontSize: 16,
                  color: TColors.secondaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Rp${orderItem.price * orderItem.quantity}',
                style: const TextStyle(
                  fontSize: 16,
                  color: TColors.secondaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PersonIcon extends StatelessWidget {
  final People person;

  const PersonIcon({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 32.0;

    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      width: avatarRadius * 2 + 8,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(person.imagePath),
            radius: avatarRadius,
          ),
          const SizedBox(height: 8),
          Text(
            person.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 14,
                color: TColors.secondaryColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
