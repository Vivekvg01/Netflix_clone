import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/custom_button.dart';

import '../../core/constants.dart';

class ComingSoon extends StatelessWidget {
  final String id;
  final String day;
  final String month;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoon({
    Key? key,
    required this.id,
    required this.day,
    required this.month,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 49,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 53,
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
                      posterPath,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext _, Widget child , ImageChunkEvent? progress) {
                        if (progress == null) {
                          return child;
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
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
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 35,
                        letterSpacing: -2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
              Text("Coming on $day $month"),
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
                maxLines: 5,
                style: const TextStyle(
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
