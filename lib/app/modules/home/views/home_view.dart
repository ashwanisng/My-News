// ignore_for_file: avoid_print

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/core/env/env.dart';

import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/app/modules/home/views/components/card_view.dart';
import 'package:news_app/app/modules/home/views/components/news_source_bottom_sheet.dart';
import 'package:news_app/app/modules/home/views/components/search_view.dart';
import 'package:news_app/app/modules/home/views/components/top_headline_text.dart';
import 'package:news_app/app/modules/news_view/views/news_view.dart';
import 'package:news_app/app/utils/no_internet.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.secondryWhite,
      body: Obx(
        () => controller.isInternetConnected.value
            ? controller.isLoading.value
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        title: const Text("MyNews"),
                        backgroundColor: Env.colors.primaryBlue,
                        actions: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Expanded(
                                  child: Text("LOCATION",
                                      style: TextStyle(fontSize: 12))),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 2),
                                      SizedBox(
                                        child: CountryListPick(
                                          theme: CountryTheme(
                                            isShowFlag: false,
                                            isShowTitle: true,
                                            isDownIcon: true,
                                            showEnglishName: true,
                                            isShowCode: false,
                                          ),
                                          onChanged: (CountryCode? code) {
                                            controller.selectedCountryNews(
                                                code!.code!);
                                          },
                                          useUiOverlay: true,
                                          useSafeArea: false,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          child: SearchView(
                            controller: controller.searchController,
                            onPressed: () {
                              controller.searchNews();
                            },
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: TopHeadLinesText(),
                      ),
                      Obx(
                        () => SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var data = controller.newsList[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => NewsView(), arguments: {
                                    'title': data.title,
                                    'description': data.description,
                                    'urlToImage': data.urlToImage,
                                    'newsSource': data.source!.name,
                                    'publishedAt': data.publishedAt,
                                    'url': data.url,
                                  });
                                },
                                child: CardView(
                                  newsSource: data.source!.name,
                                  image: data.urlToImage ??
                                      "https://cdn.pixabay.com/photo/2013/07/12/19/16/newspaper-154444_960_720.png",
                                  title: data.title,
                                ),
                              );
                            },
                            childCount: controller.newsList.length,
                          ),
                        ),
                      ),
                    ],
                  )
            : const NoInternet(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Env.colors.primaryBlue,
        onPressed: () {
          Get.bottomSheet(NewsSourceBottomSheet());
        },
        child: const Icon(Icons.filter_list_alt, color: Colors.white),
      ),
    );
  }
}
