import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PenjualanController extends GetxController {
  final namaBarangC = TextEditingController();
  final jumlahC = TextEditingController();
  final hargaC = TextEditingController();

  var kategori = "".obs;
  var total = 0.0.obs;
  var totalDiskon = 0.0.obs;

  final List<String> kategoriList = [
    "Makanan",
    "Minuman",
    "Alat Tulis",
  ];

  void hitungTotal() {
    final jumlah = int.tryParse(jumlahC.text) ?? 0;
    final harga = double.tryParse(hargaC.text) ?? 0.0;
    total.value = jumlah * harga;

    if (total.value >= 100000) {
      totalDiskon.value = total.value * 0.9; // diskon 10%
    } else {
      totalDiskon.value = total.value;
    }
  }

  void resetForm() {
    namaBarangC.clear();
    jumlahC.clear();
    hargaC.clear();
    kategori.value = "";
    total.value = 0.0;
    totalDiskon.value = 0.0;
  }
}