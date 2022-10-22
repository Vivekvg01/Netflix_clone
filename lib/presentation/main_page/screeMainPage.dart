import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/downloads/widgets/screenDownloads.dart';
import 'package:netflix_app/presentation/fast_laughs/screenFastLaugh.dart';
import 'package:netflix_app/presentation/home/screenHome.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottomNav.dart';
import 'package:netflix_app/presentation/new_and_hot/screenNewAndHot.dart';
import 'package:netflix_app/presentation/search/screenSearch.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (BuildContext ctx, int pageIndex, Widget? _) {
            return _pages[pageIndex];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
