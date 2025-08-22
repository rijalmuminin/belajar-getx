import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/modules/album/controllers/album_controller.dart';
import 'package:belajar_getx/app/modules/album/views/album_detail.dart';

class AlbumView extends StatelessWidget {
  final AlbumController controller = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Albums (GetX + GetConnect)")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.albums.isEmpty) {
          return Center(child: Text("No albums available"));
        }
        return ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final album = controller.albums[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(album.title),
                subtitle: Text("Album ID: ${album.id}"),
                onTap: () {
                  // pindah ke detail view
                  Get.to(() => AlbumDetailView(album: album));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
