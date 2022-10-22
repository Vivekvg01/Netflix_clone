import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fastLaugh/fastlaugh_bloc.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/videoListItem.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      BlocProvider.of<FastlaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastlaughBloc, FastlaughState>(
            builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while getting Data'),
            );
          } else if (state.videosList.isEmpty) {
            const Center(
              child: Text('Video List empty'),
            );
          }
          return PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              state.videosList.length,
              (index) => VideoListItemInheritedWidget(
                widget: VideoListItem(
                  key: Key(
                    index.toString(),
                  ),
                  index: index,
                ),
                movieData: state.videosList[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}
