import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/numberCard.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => NumberCard(
            index: index,
          ),
        ),
      ),
    );
  }
}
