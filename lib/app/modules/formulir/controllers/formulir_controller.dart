import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormulirController extends GetxController {
  final nameController = TextEditingController();

  final courses = ["Flutter", "Laravel", "React", "NodeJS"].obs;
  final selectedCourses = "".obs;

  final gender = "".obs;

  final selectedDate = DateTime.now().obs;

  String get formattedDate => DateFormat('dd-MM-yyyy').format(selectedDate.value);

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  void clearForm() {
    nameController.clear();
    selectedCourses.value = "";
    gender.value = "";
    selectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
