import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'package:splitify/const/colors.dart';
import 'package:splitify/model/bill.dart';
import 'package:splitify/routes/routes.dart';
import 'package:splitify/view/add_bills.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Bill> bills = allBills;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  createSlideRoute(const AddBillsView()),
                );
              },
              backgroundColor: TColors.blueAccent,
              foregroundColor: TColors.whiteAccent,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    BillsCard(bill: bills[index]),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BillsCard extends StatelessWidget {
  final Bill bill;

  const BillsCard({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const StretchMotion(),
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                clipBehavior: Clip.hardEdge,
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: TColors.blueAccent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.edit,
                  color: TColors.blueAccent,
                ),
              ),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const StretchMotion(),
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(right: 16),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: ShapeDecoration(
            color: TColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bill.imageSrc),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bill.location,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('EEEE, dd MMMM yyyy').format(bill.date),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Rp${bill.totalAmount.toStringAsFixed(2)}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
