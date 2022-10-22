import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/imageCard.dart';
import 'package:netflix_app/presentation/widgets/mainTitle.dart';

class MainTitleCard extends StatelessWidget {
  final String title;

  const MainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => const ImageCard(),
            ),
          ),
        ),
      ],
    );
  }
}
