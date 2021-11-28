import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/app/data/model/articel.dart';
import 'package:news_app/app/data/service/api.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/app/utils/new_source_name.dart';

class NewsSourceController extends GetxController {
  // var isChecked = false.obs;

  HomeController homeController = Get.find<HomeController>();

  List<bool> isChecked = [
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  void selectedNewsSourceNews() async {
    try {
      homeController.newsList.clear();

      homeController.isLoading(true);

      FetchFromApi fetchFromApi = FetchFromApi();

      for (int i = 0; i < isChecked.length; i++) {
        var sourceNewsList = <Article>[];
        if (isChecked[i]) {
          var data = await fetchFromApi.fetchFromSelectedNewsSource(
              NewsSourceName().newsSources[i]['id'].toString());

          for (var i = 0; i < data!.articles.length; i++) {
            if (data.articles[i].urlToImage != null &&
                data.articles[i].source!.name!.isNotEmpty) {
              sourceNewsList.add(data.articles[i]);
            }
          }
        }
        homeController.newsList.addAll(sourceNewsList);
      }
    } finally {
      homeController.isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedNewsSourceNews();
  }
}
