import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/appBarWidget.dart';

import '../../../application/downloads/downloads_bloc.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = const [
    _SmartDownloads(),
    Section2(),
    Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: AppBarWidget(title: 'Downloads'),
        preferredSize: Size.fromHeight(50),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) => _widgetList[index],
        separatorBuilder: (ctx, index) => const SizedBox(height: 25),
        itemCount: _widgetList.length,
      ),
    );
  }
}

//smart downloads section
class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text('Smart Downlodads'),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\n movies and shows for you.so there's\n always something to watch on your \ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              height: size.width,
              width: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.downloads.isNotEmpty
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: size.width * 0.37,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads[0].posterPath}',
                              angle: 25,
                              margin: const EdgeInsets.only(left: 170, top: 50),
                              size: Size(size.width * 0.35, size.width * 0.55),
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads[1].posterPath}',
                              angle: -25,
                              margin:
                                  const EdgeInsets.only(right: 170, top: 50),
                              size: Size(size.width * 0.35, size.width * 0.55),
                            ),
                            DownloadsImageWidget(
                              raduis: 10,
                              imageList:
                                  '$imageAppendUrl${state.downloads[2].posterPath}',
                              angle: 0,
                              margin:
                                  const EdgeInsets.only(bottom: 35, top: 50),
                              size: Size(size.width * 0.4, size.width * 0.6),
                            ),
                          ],
                        )
                      : const Center(child: Text('Downloads not found')),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: kButtonBlueColor,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Set Up',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          kHeight,
          MaterialButton(
            color: kButtonWhiteColor,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See What You Can Download',
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    required this.margin,
    required this.size,
    this.angle = 0,
    this.raduis = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double raduis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(raduis),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imageList,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
