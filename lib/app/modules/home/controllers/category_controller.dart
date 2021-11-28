// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:news_app/app/data/service/api.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';

class CategoryController extends GetxController {
  var selectedCategory = "".obs;

  HomeController homeController = Get.find<HomeController>();

  // Show the list of categories

  Future<void> showCategoryNews() async {
    try {
      homeController.newsList.clear();

      homeController.isLoading(true);

      FetchFromApi fetchFromApi = FetchFromApi();
      var data =
          await fetchFromApi.categoryWiseNews(selectedCategory.toLowerCase());

      for (var i = 0; i < data!.articles.length; i++) {
        if (data.articles[i].urlToImage != null &&
            data.articles[i].source!.name!.isNotEmpty) {
          homeController.newsList.add(data.articles[i]);
        }
      }
    } finally {
      homeController.isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    // showCategoryNews();
  }
}
