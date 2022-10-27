import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domian/core/failures/main_failure.dart';
import 'package:netflix_app/domian/hot_and_new_resp/hot_and_new_service.dart';

import '../../domian/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;

  HomeBloc(this._homeService) : super(HomeState.initial()) {
    //on event get home screen data
    on<HomeEvent>((event, emit) async {
      //send loading to ui
      emit(state.copyWith(
        isLoading: true,
        hasError: false,
      ));

      //get data
      final _movieReslut = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      //transom data
      final _state1 = _movieReslut.fold((MainFailure failure) {
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          souuthIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final trending = resp.results;
        final tesneDrama = resp.results;
        final southIndian = resp.results;

        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: pastYear,
          trendingMovieList: trending,
          tenseDramaMovieList: tesneDrama,
          souuthIndianMovieList: southIndian,
          trendingTvList: state.trendingTvList,
          isLoading: false,
          hasError: true,
        );
      });

      //send to ui
      emit(_state1);

      final _state2 = _tvResult.fold((MainFailure failure) {
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramaMovieList: [],
          souuthIndianMovieList: [],
          trendingTvList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        final top10List = resp.results;
        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tenseDramaMovieList: state.tenseDramaMovieList,
          souuthIndianMovieList: state.souuthIndianMovieList,
          trendingTvList: top10List,
          isLoading: false,
          hasError: false, 
        );
      });

      //send to ui
      emit(_state2);
    });
  }
}
