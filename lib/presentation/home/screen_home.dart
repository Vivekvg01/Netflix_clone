import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/backgroud_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';
import 'package:netflix_app/presentation/widgets/main_titleCard.dart';
import 'package:netflix_app/presentation/widgets/number_titleCard.dart';

ValueNotifier scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });

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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text('Error while getting data'),
                      );
                    } else {
                      final releasedPastYear = state.pastYearMovieList.map((m) {
                        return'$imageAppendUrl.${m.posterPath}';
                      }).toList(); 
                      return ListView(
                        children:  [
                          BackgroundCard(),
                          MainTitleCard(
                            title: "Released in the Past Year",
                            posterList: releasedPastYear,
                          ),
                          kHeight,
                          MainTitleCard(
                            title: "Trending Now ",
                            posterList: [],
                          ),
                          kHeight,
                          MainTitle(
                            title: "Top 10 TV Shows In India Today",
                          ),
                          kHeight,
                          NumberTitleCard(),
                          kHeight,
                          MainTitleCard(
                            title: "Tense Drama",
                            posterList: [],
                          ),
                          kHeight,
                          MainTitleCard(
                            title: "South Indian Cinimas",
                            posterList: [],
                          ),
                          kHeight,
                        ],
                      );
                    }
                  },
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
