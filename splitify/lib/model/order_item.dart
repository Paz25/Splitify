class OrderItem {
  String name;
  int price;
  int quantity;
  int? discount;

  OrderItem({
    required this.name,
    required this.price,
    required this.quantity,
    this.discount,
  });
}

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
