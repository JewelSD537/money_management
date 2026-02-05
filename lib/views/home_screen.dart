import 'package:flutter/material.dart';

import '../coustom_widget/build_list.dart';
import '../coustom_widget/build_summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "Money Management",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Earning", icon: Icon(Icons.arrow_upward)),
            Tab(text: "Expanse", icon: Icon(Icons.arrow_downward)),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              BuildSummaryCard(
                title: 'Earning',
                amount: '510',
                cardColors: Colors.green,
              ),
              BuildSummaryCard(
                title: 'Expanse',
                amount: '510',
                cardColors: Colors.red,
              ),
              BuildSummaryCard(
                title: 'Balance',
                amount: '1200',
                cardColors: Colors.lightGreenAccent,
              ),
            ],
          ),
          SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BuildList(),
                BuildList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
