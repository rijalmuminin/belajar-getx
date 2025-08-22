import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjualan_controller.dart';
import 'penjualan_view.dart';

class OutputView extends StatelessWidget {
  OutputView({super.key});

  final PenjualanController controller = Get.find<PenjualanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Output Penjualan"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() => Card(
              elevation: 4,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Judul
                    Center(
                      child: Text(
                        "Hasil Penjualan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),

                    /// Data Output
                    buildItem("Nama Barang", controller.namaBarangC.text),
                    buildItem("Kategori", controller.kategori.value),
                    buildItem("Jumlah", controller.jumlahC.text),
                    buildItem("Harga per Unit", "Rp ${controller.hargaC.text}"),
                    buildItem(
                        "Total Sebelum Diskon", "Rp ${controller.total.value}"),
                    buildItem("Total Setelah Diskon",
                        "Rp ${controller.totalDiskon.value}"),

                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),

                    /// Tombol Aksi
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade500,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text("Kembali"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              controller.resetForm();
                              Get.off(() => PenjualanView());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade500,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.refresh),
                            label: const Text("Reset"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  /// Widget Helper buat item data
  Widget buildItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}