import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/customButton.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyonesWatching.dart';
import '../../core/constants.dart';
import 'comingSoonWidget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
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
              kWidth
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(text: "🍿 Coming Soon"),
                Tab(text: "👀 Everyone's watching"),
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(90),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching("Everyone's watching"),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoon(),
    );
  }

  _buildEveryonesWatching(String name) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, index) => const EveryonesWatching(),
    );
  }
}
