import 'package:get/get.dart';

import '../modules/album/bindings/album_binding.dart';
import '../modules/album/views/album_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/formulir/bindings/formulir_binding.dart';
import '../modules/formulir/views/formulir_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/counter_view.dart';
import '../modules/penjualan/bindings/penjualan_binding.dart';
import '../modules/penjualan/views/penjualan_view.dart';
import '../modules/posts/bindings/posts_binding.dart';
import '../modules/posts/views/posts_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.FORMULIR,
      page: () => FormulirView(),
      binding: FormulirBinding(),
    ),
    GetPage(
      name: _Paths.PENJUALAN,
      page: () => PenjualanView(),
      binding: PenjualanBinding(),
    ),
    GetPage(
      name: _Paths.POSTS,
      page: () => PostView(),
      binding: PostsBinding(),
    ),
    GetPage(
      name: _Paths.ALBUM,
      page: () => AlbumView(),
      binding: AlbumBinding(),
    ),
  ];
}
