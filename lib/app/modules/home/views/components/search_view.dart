// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news_app/app/core/env/env.dart';

class SearchView extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey();

  SearchView({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Env.colors.secondryGrey,
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          filled: true,
          fillColor: Env.colors.secondryGrey,
          hintText: "Search for news, topics...",
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
