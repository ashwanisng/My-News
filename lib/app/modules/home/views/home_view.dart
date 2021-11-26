import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/core/env/env.dart';

import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/app/modules/home/views/components/search_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Env.colors.secondryWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("MyNews"),
            backgroundColor: Env.colors.primaryBlue,
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("LOCATION", style: TextStyle(fontSize: 12)),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          size: 14,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "India",
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: SearchView(controller: controller.searchController),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Env.colors.primaryBlue,
        onPressed: () {
          Get.toNamed('/second');
        },
        child: const Icon(Icons.filter_list_alt, color: Colors.white),
      ),
    );
  }
}
