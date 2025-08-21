import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/penjualan_controller.dart';
import 'penjualan_output_view.dart';

class PenjualanView extends StatelessWidget {
  PenjualanView({super.key});
  final penjualan = Get.put(PenjualanController());

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Form Penjualan Barang"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildTextField(
                    controller: penjualan.namaBarangController,
                    label: "Nama Barang",
                    icon: Icons.inventory_2,
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    controller: penjualan.jumlahController,
                    label: "Jumlah",
                    icon: Icons.format_list_numbered,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    controller: penjualan.hargaController,
                    label: "Harga per Unit",
                    icon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => DropdownButtonFormField<String>(
                      value: penjualan.kategori.value.isEmpty
                          ? null
                          : penjualan.kategori.value,
                      decoration: InputDecoration(
                        labelText: "Kategori Barang",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      items: penjualan.kategoriList
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        if (val != null) penjualan.kategori.value = val;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (penjualan.namaBarangController.text.isEmpty ||
                            penjualan.jumlahController.text.isEmpty ||
                            penjualan.hargaController.text.isEmpty ||
                            penjualan.kategori.value.isEmpty) {
                          Get.snackbar(
                            "Peringatan",
                            "Semua field harus diisi!",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }

                        penjualan.hitungTotal();
                        Get.to(() => PenjualanOutputView());
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text("Proses"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
