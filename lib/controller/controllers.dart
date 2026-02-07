import 'package:get/get.dart';

class Controllers extends GetxController {

  RxList<Map<String, dynamic>> earnings = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> expenses = <Map<String, dynamic>>[].obs;

  /// ADD item
  void addItem({
    required bool isEarning,
    required String title,
    required double amount,
  }) {
    final data = {
      "title": title,
      "amount": amount,
      "date": DateTime.now(),
    };

    if (isEarning) {
      earnings.add(data);
    } else {
      expenses.add(data);
    }
  }

  /// DELETE item
  void deleteItem(bool isEarning, int index) {
    if (isEarning) {
      earnings.removeAt(index);
    } else {
      expenses.removeAt(index);
    }
  }
}
