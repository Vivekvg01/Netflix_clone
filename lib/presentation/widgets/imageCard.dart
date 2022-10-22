import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          image: NetworkImage(
            "https://www.themoviedb.org/t/p/w188_and_h282_bestv2/khNVygolU0TxLIDWff5tQlAhZ23.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
