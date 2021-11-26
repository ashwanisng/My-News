import 'package:flutter/material.dart';
import 'package:news_app/app/core/env/env.dart';

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
  }) : super(key: key);

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
                  children: const [
                    Flexible(
                      child: Text(
                        "Main Headline",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    ),
                    // SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        "India vs New Zealand 1st Test, Day 2 Highlights: New Zealand made a strong reply to India’s first innings total of 345 all out, reaching 129 for no loss at stumps on the second day of the opening Test here on Friday. Will Young and Tom Latham were batting on 75 and 50 respectively at close of play on Day 2. New Zealand still trail the hosts by 216 runs. India started the day on 258 for four.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        softWrap: false,
                      ),
                    ),
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
                  child: Expanded(
                    child: Image.asset(
                      "assets/images/news.jpg",
                      fit: BoxFit.cover,
                      // height: 100,
                      // width: 100,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
