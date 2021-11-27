import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/model/articel.dart';
import 'package:news_app/app/data/service/api.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';

class CountryController extends GetxController {
  //TODO: Implement HomeController

  var newsList = <Article>[].obs;

  HomeController homeController = Get.find<HomeController>();

  var isChecked = false.obs;

  late String countryCode;

  @override
  void onInit() {
    super.onInit();

    selectedCountryNews();
  }

  void selectedCountryNews() async {
    try {
      FetchFromApi fetchFromApi = FetchFromApi();
      var data = await fetchFromApi.fetchCountryNews(countryCode);

      for (var i = 0; i < data!.articles.length; i++) {
        if (data.articles[i].urlToImage != null &&
            data.articles[i].source!.name!.isNotEmpty) {
          homeController.newsList.addAll(data.articles);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
