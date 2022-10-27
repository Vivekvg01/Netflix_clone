import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/custom_button.dart';
import '../../../core/constants.dart';
import '../../widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryOnesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
          description,
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: kGreyColor,
          ),
        ),
        kHeigth50,
         VideoWidget(url: posterPath,),
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
