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
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Money Management",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Earning", icon: Icon(Icons.arrow_upward)),
            Tab(text: "Expense", icon: Icon(Icons.arrow_downward)),
          ],
        ),
      ),

      body: Column(
        children: [
          Row(
            children: const [
              BuildSummaryCard(
                title: 'Earning',
                amount: '510',
                cardColors: Colors.green,
              ),
              BuildSummaryCard(
                title: 'Expense',
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

          const SizedBox(height: 12),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BuildList(isColors: true),
                BuildList(isColors: false),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => _showOption(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

///...............BOTTOM SHEETS .................

void _showOption(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                Navigator.pop(ctx); // close option sheet
                _showForm(context, true);
              },
              child: const Text("Add Earning"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                Navigator.pop(ctx); // close option sheet
                _showForm(context, false);
              },
              child: const Text("Add Expense"),
            ),
          ],
        ),
      );
    },
  );
}

void _showForm(BuildContext context, bool isEarning) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (ctx) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isEarning ? "Add Earning" : "Add Expense",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      );
    },
  );
}
