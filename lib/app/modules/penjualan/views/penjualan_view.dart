import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjualan_controller.dart';
import 'penjualan_output_view.dart';

class PenjualanView extends StatelessWidget {
  PenjualanView({super.key});

  final PenjualanController controller = Get.put(PenjualanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Form Penjualan Barang"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// Judul Form
                Text(
                  "Input Data Penjualan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(height: 24),

                /// Nama Barang
                TextField(
                  controller: controller.namaBarangC,
                  decoration: InputDecoration(
                    labelText: "Nama Barang",
                    prefixIcon: const Icon(Icons.shopping_bag),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Jumlah
                TextField(
                  controller: controller.jumlahC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Jumlah",
                    prefixIcon: const Icon(Icons.format_list_numbered),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Harga per Unit
                TextField(
                  controller: controller.hargaC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Harga per Unit",
                    prefixIcon: const Icon(Icons.price_change),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Kategori
                Obx(() => DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Kategori Barang",
                        prefixIcon: const Icon(Icons.category),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      value: controller.kategori.value.isEmpty
                          ? null
                          : controller.kategori.value,
                      items: controller.kategoriList.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (val) {
                        controller.kategori.value = val!;
                      },
                    )),
                const SizedBox(height: 28),

                /// Tombol Submit
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      controller.hitungTotal();
                      Get.to(() => OutputView());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.check_circle, color: Colors.white),
                    label: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}