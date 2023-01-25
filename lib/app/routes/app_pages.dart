import 'package:get/get.dart';

import '../modules/PickImage/bindings/pick_image_binding.dart';
import '../modules/PickImage/views/pick_image_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PICK_IMAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PICK_IMAGE,
      page: () => PickImageView(),
      binding: PickImageBinding(),
    ),
  ];
}
