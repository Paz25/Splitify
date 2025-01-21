import 'package:flutter/material.dart';

import 'package:splitify/component/appbar_component.dart';
import 'package:splitify/component/button_component.dart';
import 'package:splitify/const/colors.dart';
import 'package:splitify/model/people.dart';
import 'package:splitify/routes/routes.dart';
import 'package:splitify/view/add_items.dart';

class AddPeopleView extends StatefulWidget {
  const AddPeopleView({super.key});

  @override
  State<AddPeopleView> createState() => _AddPeopleViewState();
}

class _AddPeopleViewState extends State<AddPeopleView> {
  List<People> people = allPeople;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: primaryAppBar(context: context, title: 'Add People'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return PeopleCard(
                    person: people[index],
                  );
                },
              ),
              SizedBox(
                width: double.infinity,
                child: buttonPrimaryOutline(
                  context: context,
                  text: 'Add One More Person',
                ),
              ),
              const SizedBox(height: 72),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          color: TColors.tertiaryColor,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: buttonPrimary(
              context: context,
              text: "Add Items",
              onPressed: () {
                Navigator.of(context)
                    .push(createSlideRoute(const AddItemsView()));
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class PeopleCard extends StatelessWidget {
  final People person;

  const PeopleCard({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: TColors.blueAccent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(person.imagePath),
                        radius: 26,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        person.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: TColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.edit,
                    color: TColors.blueAccent,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 68,
            height: 68,
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
        ],
      ),
    );
  }
}
