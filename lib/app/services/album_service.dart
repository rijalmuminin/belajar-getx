import 'package:get/get.dart';
import 'package:belajar_getx/app/data/models/album_model.dart';

class AlbumService extends GetConnect {
  Future<List<Album>> fetchAlbum() async {
    final response = await get("https://jsonplaceholder.typicode.com/posts");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching posts");
    } else {
      final List<dynamic> data = response.body;
      return data.map((e) => Album.fromJson(e)).toList();
    }
  }
}
