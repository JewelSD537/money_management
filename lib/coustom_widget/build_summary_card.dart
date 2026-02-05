import 'package:flutter/material.dart';
class BuildSummaryCard extends StatelessWidget {

  final String title, amount;
  final Color cardColors;
  const BuildSummaryCard({super.key,
    required this.title,
    required this.amount,
    required this.cardColors});


  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Card(
        color: cardColors,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(title, style:  TextStyle(fontSize: 16),),
              Text(amount, style:  TextStyle(fontSize: 22),),
            ],
          ),
        ),
      ),
    );
  }
}
