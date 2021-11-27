// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/model/articel.dart';
import 'package:news_app/app/data/service/api.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  TextEditingController searchController = TextEditingController();
  var newsList = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchNews();
  }

  void fetchNews() async {
    try {
      FetchFromApi fetchFromApi = FetchFromApi();
      var data = await fetchFromApi.getNews();

      for (var i = 0; i < data!.articles.length; i++) {
        if (data.articles[i].urlToImage != null &&
            data.articles[i].source!.name!.isNotEmpty) {
          newsList.addAll(data.articles);
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
