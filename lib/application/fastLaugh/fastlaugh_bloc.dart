import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domian/downloads/i_downloads_repo.dart';

import '../../domian/downloads/models/downloads.dart';

part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';
part 'fastlaugh_bloc.freezed.dart';

final videoUrls = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
];

@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  FastlaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastlaughState.initial()) {
    on<Initialize>((event, emit) async {

      //sending loading to UI
      emit(const FastlaughState(
        videosList: [],
        isLoading: true,
        isError: false,
      ));

      // get trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold((l) {
        return const FastlaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        );
      }, (resp) {
        return FastlaughState(
          videosList: resp,
          isLoading: false,
          isError: false,
        );
      });

      //send to ui
      emit(_state);
    });
  }
}
