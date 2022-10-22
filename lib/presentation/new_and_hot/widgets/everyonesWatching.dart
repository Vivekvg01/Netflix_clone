import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/customButton.dart';
import '../../../core/constants.dart';
import '../../widgets/videoWidget.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          "Moon Knight",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "This hit sitcom follows the merry misadventures of six 20-somthing pals as hry navigate the pitfails of work, life and love in 1990s manhattan",
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
        kHeigth50,
        const VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButton(
              title: "Share",
              icon: Icons.share,
            ),
            kWidth,
            CustomButton(
              title: "My List",
              icon: Icons.add,
            ),
            kWidth,
            CustomButton(
              title: "Play",
              icon: Icons.play_arrow,
            ),
            kWidth,
          ],
        ),
      ],
    );
  }
}
