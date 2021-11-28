import 'package:get/get.dart';
import 'package:news_app/app/modules/home/controllers/category_controller.dart';

import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/app/modules/home/controllers/newssource_controller.dart';
import 'package:news_app/app/modules/news_view/controllers/news_view_controller.dart';
import 'package:news_app/app/modules/newsweb/controllers/newsweb_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<NewsViewController>(
      () => NewsViewController(),
      fenix: true,
    );

    Get.lazyPut<NewsSourceController>(
      () => NewsSourceController(),
      fenix: true,
    );
    Get.lazyPut<NewsWebController>(
      () => NewsWebController(),
      fenix: true,
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
      fenix: true,
    );
  }
}
