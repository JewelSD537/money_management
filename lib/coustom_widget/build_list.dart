import 'package:flutter/material.dart';
class BuildList extends StatelessWidget {
  final List<Map<String, dynamic>> iteams =[];
  final bool isColors;
  BuildList({super.key, required this.isColors});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListView.builder(
        itemCount: iteams.length,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text("Earning", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
            subtitle: Text("01.02.2026"),
            trailing: Text(
              "4545",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
          );
        },
      ),
    );
  }
}
