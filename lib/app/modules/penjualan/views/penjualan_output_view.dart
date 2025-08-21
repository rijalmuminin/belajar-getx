import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penjualan_controller.dart';
import 'penjualan_view.dart';

class PenjualanOutputView extends StatelessWidget {
  PenjualanOutputView({super.key});
  final penjualan = Get.find<PenjualanController>();

  Widget _buildInfoRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(thickness: 1, color: Colors.black26, height: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Struk Belanjaan"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    "📦 TOKO SAGALA AYA",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 4),
                const Center(
                  child: Text(
                    "Jl. Situ tarate",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 10),
                _divider(),
                _buildInfoRow("Nama Barang", penjualan.namaBarangController.text),
                _buildInfoRow("Kategori", penjualan.kategori.value),
                _buildInfoRow("Jumlah", penjualan.jumlahController.text),
                _buildInfoRow("Harga/Unit", "Rp ${penjualan.hargaController.text}"),
                _divider(),
                _buildInfoRow("Total Sebelum Diskon", penjualan.formattedTotalSebelumDiskon,
                    isBold: true),
                _buildInfoRow("Diskon", penjualan.formattedDiskon),
                _buildInfoRow("Total Bayar", penjualan.formattedTotalSetelahDiskon,
                    isBold: true),
                _divider(),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Terima kasih telah berbelanja!",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    penjualan.resetForm();
                    Get.off(() => PenjualanView());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text("Kembali & Reset"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
