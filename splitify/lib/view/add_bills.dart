import 'package:flutter/material.dart';
import 'package:splitify/component/appbar_component.dart';
import 'package:splitify/component/button_component.dart';
import 'package:splitify/component/form_component.dart';
import 'package:splitify/routes/routes.dart';
import 'package:splitify/view/add_people.dart';

class AddBillsView extends StatefulWidget {
  const AddBillsView({super.key});

  @override
  State<AddBillsView> createState() => _AddBillsViewState();
}

class _AddBillsViewState extends State<AddBillsView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController locationController;
  String? selectedCategoryValue;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    locationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: primaryAppBar(context: context, title: 'Add New Bills'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(),
                    inputForm(
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "Please input the location of the bill";
                        }
                        return null;
                      },
                      controller: locationController,
                      helperTxt: "Location",
                    ),
                    const SizedBox(height: 24),
                    dropdownInput(
                      (value) {
                        if (value == null) {
                          return "Please select the category of bill";
                        }
                        return null;
                      },
                      dropdownMenuItems: [
                        'Food',
                        'Grocery',
                        'Entertainment',
                        'Other'
                      ],
                      helperTxt: "Category",
                      selectedValue: selectedCategoryValue,
                      onChanged: (value) {
                        setState(() {
                          selectedCategoryValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    dateInput(
                      context,
                      (date) {
                        if (date == null) {
                          return "Please select the date of the bill";
                        }
                        return null;
                      },
                      selectedDate: selectedDate,
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buttonPrimary(
            context: context,
            text: "Add People",
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                print("Selected Value: $selectedCategoryValue");
                print("Selected Date: $selectedDate");
                Navigator.of(context)
                    .push(createSlideRoute(const AddPeopleView()));
              }
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
