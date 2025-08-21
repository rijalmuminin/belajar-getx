import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PenjualanController extends GetxController {
  final namaBarangController = TextEditingController();
  final jumlahController = TextEditingController();
  final hargaController = TextEditingController();

  var kategori = "".obs;
  var totalSebelumDiskon = 0.0.obs;
  var totalSetelahDiskon = 0.0.obs;

  List<String> kategoriList = ["Makanan", "Minuman", "Alat Tulis"];

  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: "id_ID",
    symbol: "Rp ",
    decimalDigits: 0,
  );

  // Getter formatted
  String get formattedTotalSebelumDiskon =>
      currencyFormat.format(totalSebelumDiskon.value);

  String get formattedTotalSetelahDiskon =>
      currencyFormat.format(totalSetelahDiskon.value);

  double get diskon => totalSebelumDiskon.value - totalSetelahDiskon.value;

  String get formattedDiskon => currencyFormat.format(diskon);

  void hitungTotal() {
    int jumlah = int.tryParse(jumlahController.text) ?? 0;
    double harga = double.tryParse(hargaController.text) ?? 0.0;

    totalSebelumDiskon.value = jumlah * harga;

    if (totalSebelumDiskon.value >= 100000) {
      totalSetelahDiskon.value = totalSebelumDiskon.value * 0.9;
    } else {
      totalSetelahDiskon.value = totalSebelumDiskon.value;
    }
  }

  void resetForm() {
    namaBarangController.clear();
    jumlahController.clear();
    hargaController.clear();
    kategori.value = "";
    totalSebelumDiskon.value = 0.0;
    totalSetelahDiskon.value = 0.0;
  }

  @override
  void onClose() {
    namaBarangController.dispose();
    jumlahController.dispose();
    hargaController.dispose();
    super.onClose();
  }
}
