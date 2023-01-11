import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/backgroud_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';
import 'package:netflix_app/presentation/widgets/number_title_card.dart';

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
                    }
                    //released past year
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _releasedPastYear.shuffle();
                    //trending movie list
                    final _trending = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _trending.shuffle();
                    //tesne drama
                    final _tenseDrama = state.tenseDramaMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _tenseDrama.shuffle();
                    //southIndian movies
                    final _southIndian = state.tenseDramaMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southIndian.shuffle();

                    //top10 tvshows
                    final _top10tvShows = state.trendingTvList.map((t) {
                      return '$imageAppendUrl${t.posterPath}';
                    }).toList();

                    //listView
                    return ListView(
                      children: [
                        kHeight,
                        const BackgroundCard(),
                        kHeight,
                        MainTitleCard(
                          title: "Released in the Past Year",
                          posterList: _releasedPastYear,
                        ),
                        kHeight,
                        MainTitleCard(
                          title: "Trending Now ",
                          posterList: _trending,
                        ),
                        kHeight,
                        const MainTitle(
                          title: "Top 10 TV Shows",
                        ),
                        kHeight,
                        NumberTitleCard(
                          postersList: _top10tvShows.sublist(0, 10),
                        ),
                        kHeight,
                        MainTitleCard(
                          title: "Tense Drama",
                          posterList: _tenseDrama,
                        ),
                        kHeight,
                        MainTitleCard(
                          title: "Most Liked",
                          posterList: _southIndian,
                        ),
                        kHeight,
                      ],
                    );
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
