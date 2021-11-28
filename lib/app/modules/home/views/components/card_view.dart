import 'package:flutter/material.dart';
import 'package:news_app/app/core/env/env.dart';

class CardView extends StatelessWidget {
  String? newsSource;
  String? image;
  String? title;
  String? dateTime;

  CardView({
    required this.newsSource,
    required this.image,
    required this.title,
    required this.dateTime,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Text(
                        newsSource!,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    // SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        softWrap: false,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      child: Text(
                        dateTime.toString(),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.19,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Env.colors.primaryBlue,
                  ),
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                    // height: 100,
                    // width: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
