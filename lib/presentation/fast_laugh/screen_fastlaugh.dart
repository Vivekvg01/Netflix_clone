// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
// import 'package:netflix_app/presentation/fast_laugh/widgets/videoListItem.dart';

// class ScreenFastLaugh extends StatelessWidget {
//   const ScreenFastLaugh({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     WidgetsBinding.instance.addPersistentFrameCallback((_) {
//       BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
//     });

//     return Scaffold(
//       body: SafeArea(
//         child: BlocBuilder<FastLaughBloc, FastLaughState>(
//           builder: (context, state) {
//             if (state.isLoading) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                 ),
//               );
//             } else if (state.isError) {
//               return const Center(
//                 child: Text('Error while getting Data'),
//               );
//             } else if (state.videosList.isEmpty) {
//               return const Center(
//                 child: Text('Video List empty'),
//               );
//             } else {
//               return PageView(
//                 scrollDirection: Axis.vertical,
//                 children: List.generate(10, (index) {
//                   return VideoListItem(index: index);
//                 }),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
