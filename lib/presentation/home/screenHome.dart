import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/backgroudCard.dart';
import 'package:netflix_app/presentation/widgets/mainTitle.dart';
import 'package:netflix_app/presentation/widgets/mainTitleCard.dart';
import 'package:netflix_app/presentation/widgets/numberTitleCard.dart';

ValueNotifier scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext ctx, dynamic, Widget? _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;

              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackgroundCard(),
                    MainTitleCard(title: "Released in the Past Year"),
                    kHeight,
                    MainTitleCard(title: "Trending Now "),
                    kHeight,
                    MainTitle(
                      title: "Top 10 TV Shows In India Today",
                    ),
                    kHeight,
                    NumberTitleCard(),
                    kHeight,
                    MainTitleCard(title: "Tense Drama"),
                    kHeight,
                    MainTitleCard(title: "South Indian Cinimas"),
                    kHeight,
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 85,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWZbxqpwm8Rw2zxYBsj19BmxlI1tHl53b3-w&usqp=CAU",
                                    fit: BoxFit.none,
                                    height: 45,
                                    width: 33,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  height: 30,
                                  width: 30,
                                  color: Colors.blue,
                                ),
                                kWidth,
                              ],
                            ),
                            kHeight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "TV Shows",
                                  style: kTextStyle,
                                ),
                                Text(
                                  "Movies",
                                  style: kTextStyle,
                                ),
                                Text(
                                  "Categories",
                                  style: kTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
