import 'dart:math';

import 'package:splitify/model/order_item.dart';

class People {
  final String name;
  final String imagePath;
  List<OrderItem>? orderItem;

  People({required this.name, required this.imagePath, this.orderItem});
}

Random randomNumberTemp = Random();

String getRandomImagePath() {
  return 'assets/images/profile_picture/people_${randomNumberTemp.nextInt(10) + 1}.png';
}

final allPeople = [
  People(name: 'Pasha Rakha', imagePath: getRandomImagePath(), orderItem: [
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
  ]),
  People(name: 'Kaisar', imagePath: getRandomImagePath(), orderItem: [
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
  ]),
  People(
    name: 'Szwagery',
    imagePath: getRandomImagePath(),
  ),
  People(
    name: 'Claudia',
    imagePath: getRandomImagePath(),
  ),
  People(
    name: 'Russel',
    imagePath: getRandomImagePath(),
  ),
  People(
    name: 'Daflo',
    imagePath: getRandomImagePath(),
  ),
  People(
    name: 'Kikek',
    imagePath: getRandomImagePath(),
  ),
  People(
    name: 'Deta',
    imagePath: getRandomImagePath(),
  ),
  People(
    name: 'Anjes',
    imagePath: getRandomImagePath(),
  ),
];
