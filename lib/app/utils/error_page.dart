import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/core/env/env.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.doc_text_search,
              size: 100, color: Env.colors.secondryGrey),
          Center(
            child: Text(
              "No result found!",
              style: TextStyle(fontSize: 30, color: Env.colors.primaryIndigo),
            ),
          ),
        ],
      ),
    );
  }
}
