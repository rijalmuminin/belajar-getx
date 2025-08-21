import 'package:belajar_getx/app/modules/formulir/views/formulir_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirOutputView extends StatelessWidget {
   FormulirOutputView({super.key});
    final formulir = Get.find<FormulirController>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Formulir Output'), centerTitle: true),
      body: Padding(padding: const EdgeInsets.all(10), child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama: ${formulir.nameController.text}"),
              SizedBox(height: 10,),
              Text("Kursus: ${formulir.selectedCourses.value}"),
              SizedBox(height: 10,),
              Text("Tanggal: ${formulir.selectedDate}"),
              SizedBox(height: 10,),
              Text("Gender: ${formulir.gender.value}"),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  formulir.clearForm();
                  Get.off(() => FormulirView());
                },
                child: Text("Kembali"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
