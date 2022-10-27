import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/numberCard.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
    required this.postersList,
  }) : super(key: key);

  final List<String> postersList;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          postersList.length,
          (index) => NumberCard(
            index: index,
            imgUrl: postersList[index],
          ),
        ),
      ),
    );
  }
}
