import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {
        "title": "Counter",
        "icon": Icons.add_circle_outline,
        "route": "/counter",
        "color": Colors.blue,
      },
      {
        "title": "Formulir",
        "icon": Icons.article_outlined,
        "route": "/formulir",
        "color": Colors.green,
      },
      {
        "title": "Penjualan",
        "icon": Icons.shopping_cart_outlined,
        "route": "/penjualan", // nanti pastikan route ini ada di app_pages.dart
        "color": Colors.orange,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Utama',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // jumlah kolom
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () => Get.toNamed(item["route"] as String),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: (item["color"] as Color).withOpacity(0.9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item["icon"] as IconData,
                      size: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item["title"] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
