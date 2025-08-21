import 'package:belajar_getx/app/modules/formulir/views/formulir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends StatefulWidget {
  const FormulirView({Key? key}) : super(key: key);

  @override
  State<FormulirView> createState() => _FormulirViewState();
}

class _FormulirViewState extends State<FormulirView> {
  final FormulirController controller = Get.put(FormulirController());
  bool _pressed = false; // untuk animasi 3D tombol

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text(
          'Formulir',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 8,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Nama
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                labelStyle: TextStyle(color: Colors.deepPurple.shade700),
                prefixIcon: const Icon(Icons.person, color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown kursus
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Pilih kursus',
                labelStyle: TextStyle(color: Colors.deepPurple.shade700),
                prefixIcon: const Icon(Icons.school, color: Colors.deepPurple),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: controller.courses.map((course) {
                return DropdownMenuItem(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedCourses.value = value!;
              },
            ),
            const SizedBox(height: 20),

            // Gender
            Obx(
              () => Column(
                children: [
                  RadioListTile(
                    title: const Text("Laki-laki"),
                    value: 'laki-laki',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                  RadioListTile(
                    title: const Text("Perempuan"),
                    value: 'perempuan',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tanggal Lahir
            Obx(
              () => TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Tanggal Lahir',
                  labelStyle: TextStyle(color: Colors.deepPurple.shade700),
                  prefixIcon: const Icon(Icons.calendar_today, color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                controller: TextEditingController(
                  text: controller.formattedDate,
                ),
                onTap: () => controller.pickDate(),
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Submit (3D Effect)
            GestureDetector(
              onTapDown: (_) => setState(() => _pressed = true),
              onTapUp: (_) {
                setState(() => _pressed = false);
                Get.to(() => FormulirOutputView());
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                transform: _pressed
                    ? Matrix4.translationValues(0, 4, 0)
                    : Matrix4.translationValues(0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: _pressed
                      ? []
                      : [
                          const BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(1, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } 
}
