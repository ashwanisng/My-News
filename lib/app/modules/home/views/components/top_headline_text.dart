import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/core/env/env.dart';
import 'package:news_app/app/modules/home/controllers/category_controller.dart';

class TopHeadLinesText extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Top Headlines",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Text("Sort: "),
              DropdownButton<String>(
                value: controller.selectedCategory.isNotEmpty
                    ? controller.selectedCategory
                    : null,
                key: UniqueKey(),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Env.colors.primaryIndigo,
                ),
                items: <String>[
                  "business",
                  "entertainment",
                  "sports",
                  "general",
                  "technology",
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (dynamic newVal) {
                  // controller.selectedCategory.value = newVal;
                  controller.setSelected(newVal);
                  print(newVal);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
