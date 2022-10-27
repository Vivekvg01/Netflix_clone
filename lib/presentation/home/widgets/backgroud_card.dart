import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/home/widgets/customButtonWidget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://www.themoviedb.org/t/p/w440_and_h660_face/ew80hVHkBR6i8vIFVuoaLldRVvX.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                title: "My List",
                icon: Icons.add,
              ),
              _playButton(),
              const CustomButtonWidget(
                title: "Info",
                icon: Icons.info_outline,
              )
            ],
          ),
        ),
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        kWhiteColor,
      ),
    ),
    onPressed: () {},
    icon: const Icon(
      Icons.play_arrow,
      color: kBlackColor,
      size: 30,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Text(
        "Play",
        style: TextStyle(
            color: kBlackColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
