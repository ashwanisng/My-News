import 'package:flutter/material.dart';
import 'package:news_app/app/core/env/env.dart';

class SearchView extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SearchView({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Env.colors.secondryGrey,
      ),
      child: TextFormField(
        key: formKey,
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search for news, topics...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon:
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ),
      ),
    );
  }
}
