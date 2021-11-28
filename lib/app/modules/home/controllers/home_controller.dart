// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/model/articel.dart';
import 'package:news_app/app/data/service/api.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  TextEditingController searchController = TextEditingController();
  var newsList = <Article>[].obs;

  var isChecked = false.obs;

  var isLoading = false.obs;
  var isError = false;
  var isInternetConnected = false.obs;

  final connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
    searchNews();

    getConnectionType();
    subscription =
        connectivity.onConnectivityChanged.listen(getConnectionStatus);
  }

  Future<void> getConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = await connectivity.checkConnectivity();
    } catch (e) {
      print(e);
    }
    return getConnectionStatus(connectivityResult);
  }

  getConnectionStatus(ConnectivityResult connectivityResult) async {
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      isInternetConnected.value = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isInternetConnected.value = true;
    } else if (connectivityResult == ConnectivityResult.none) {
      isInternetConnected.value = false;
    }
  }

  void selectedCountryNews(String code) async {
    try {
      newsList.clear();

      FetchFromApi fetchFromApi = FetchFromApi();
      var data = await fetchFromApi.fetchCountryNews(code);

      for (var i = 0; i < data!.articles.length; i++) {
        if (data.articles[i].urlToImage != null &&
            data.articles[i].source!.name!.isNotEmpty) {
          newsList.add(data.articles[i]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void fetchNews() async {
    try {
      newsList.clear();

      FetchFromApi fetchFromApi = FetchFromApi();
      var data = await fetchFromApi.getNews();

      for (var i = 0; i < data!.articles.length; i++) {
        if (data.articles[i].urlToImage != null &&
            data.articles[i].source!.name!.isNotEmpty) {
          newsList.add(data.articles[i]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void searchNews() async {
    try {
      newsList.clear();

      FetchFromApi fetchFromApi = FetchFromApi();
      var data = await fetchFromApi.searchNews(searchController.text);

      if (data != null) {
        for (var i = 0; i < data!.articles.length; i++) {
          if (data.articles[i].urlToImage != null &&
              data.articles[i].source!.name!.isNotEmpty) {
            newsList.add(data.articles[i]);
          }
        }
      } else {
        isError = true;
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
