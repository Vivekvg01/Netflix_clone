import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/customButton.dart';

import '../../core/constants.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                      "https://www.themoviedb.org/t/p/w710_and_h400_multi_faces/56v2KjBlU4XaOv9rVYEQypROD7P.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off,
                          color: kWhiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Stanger Things",
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: -3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButton(
                        title: "Remind Me",
                        icon: Icons.all_out_sharp,
                        iconSize: 20,
                        fontSize: 12,
                      ),
                      kWidth,
                      CustomButton(
                        title: "Info",
                        icon: Icons.info,
                        iconSize: 20,
                        fontSize: 12,
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHeight,
              const Text("Coming on Friday"),
              kHeight,
              const Text(
                "Stanger Things",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              const Text(
                "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.",
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
