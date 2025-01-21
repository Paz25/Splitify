import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:splitify/component/appbar_component.dart';
import 'package:splitify/component/button_component.dart';
import 'package:splitify/component/form_component.dart';
import 'package:splitify/const/colors.dart';
import 'package:splitify/model/order_item.dart';
import 'package:splitify/routes/routes.dart';
import 'package:splitify/view/select_option.dart';

class AddItemsView extends StatefulWidget {
  const AddItemsView({super.key});

  @override
  State<AddItemsView> createState() => _AddItemsViewState();
}

class _AddItemsViewState extends State<AddItemsView> {
  List<OrderItem> orderItems = allOrderItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: primaryAppBar(context: context, title: 'Add Items'),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: orderItems.length + 1,
                itemBuilder: (context, index) {
                  if (index < orderItems.length) {
                    return ItemCard(orderItem: orderItems[index]);
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: buttonPrimaryOutline(
                              context: context,
                              text: 'Add One More Item',
                              onPressed: () {
                                // Logic to add a new OrderItem
                                // For example, you might want to show a dialog or navigate to another screen
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 136),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
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
                        .push(createSlideRoute(const SelectOptionView()));
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

class ItemCard extends StatefulWidget {
  final OrderItem orderItem;

  const ItemCard({
    super.key,
    required this.orderItem,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool _showDiscountInput = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const StretchMotion(),
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16.0, right: 16),
                clipBehavior: Clip.hardEdge,
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: TColors.redAccent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.delete,
                  color: TColors.redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: TColors.blueAccent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.orderItem.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: TColors.secondaryColor,
                    ),
                  ),
                  const Icon(
                    Icons.edit,
                    color: TColors.blueAccent,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        '@',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: TColors.secondaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      boxedInputForm(width: 100),
                      const SizedBox(width: 8),
                      const Text(
                        'x',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: TColors.secondaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      boxedInputForm(width: 40),
                    ],
                  ),
                  Text(
                    'Rp${widget.orderItem.price}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: TColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _showDiscountInput
                  ? addDiscount()
                  : tempAddDiscountButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Row addDiscount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.cancel_outlined,
                color: TColors.redAccent,
              ),
              onPressed: () {
                setState(() {
                  _showDiscountInput = false;
                });
              },
            ),
            const Text(
              'Discounts',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: TColors.secondaryColor,
              ),
            ),
          ],
        ),
        boxedInputForm(width: 100),
      ],
    );
  }

  SizedBox tempAddDiscountButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: buttonSecondary(
        context: context,
        text: 'Add Discount',
        onPressed: () {
          setState(() {
            _showDiscountInput = true;
          });
        },
      ),
    );
  }
}
