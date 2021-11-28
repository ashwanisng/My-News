import 'package:get/get.dart';
import 'package:news_app/app/modules/newsweb/controllers/newsweb_controller.dart';

class NewsWebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsWebController>(
      () => NewsWebController(),
    );
  }
}
