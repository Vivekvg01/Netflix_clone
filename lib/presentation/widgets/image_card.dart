import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class ImageCard extends StatelessWidget {
  final String imgUrl;
  const ImageCard({
    Key? key, required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          image: NetworkImage(
            imgUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
