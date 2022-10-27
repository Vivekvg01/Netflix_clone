import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domian/core/failures/main_failure.dart';
import 'package:netflix_app/domian/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix_app/domian/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get hot and new movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //send ui loading
      emit(const HotAndNewState(
        comingSoonList: [],
        everyonesWatchingList: [],
        isLoading: false,
        hasError: false,
      ));

      //get data from remote
      final _reslult = await _hotAndNewService.getHotAndNewMovieData();

      //data to stat
      final _newState = _reslult.fold(
        (MainFailure falure) {
          return const HotAndNewState(
            comingSoonList: [],
            everyonesWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            comingSoonList: resp.results,
            everyonesWatchingList: state.everyonesWatchingList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_newState);
    });

    //get hot and new tv data
    on<LoadDataInEveryOnesWatching>((event, emit) async{
       //send ui loading
      emit(const HotAndNewState(
        comingSoonList: [],
        everyonesWatchingList: [],
        isLoading: false,
        hasError: false,
      ));

      //get data from remote
      final _reslult = await _hotAndNewService.getHotAndNewTvData();

      //data to stat
      final _newState = _reslult.fold(
        (MainFailure falure) {
          return const HotAndNewState(
            comingSoonList: [],
            everyonesWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyonesWatchingList: resp.results,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_newState);
    });
  }
}
