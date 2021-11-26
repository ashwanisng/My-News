import 'package:get/get.dart';

import 'package:news_app/app/modules/home/bindings/home_binding.dart';
import 'package:news_app/app/modules/home/views/home_view.dart';
import 'package:news_app/app/modules/news_view/bindings/news_view_binding.dart';
import 'package:news_app/app/modules/news_view/views/news_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_VIEW,
      page: () => NewsView(),
      binding: NewsViewBinding(),
    ),
  ];
}
