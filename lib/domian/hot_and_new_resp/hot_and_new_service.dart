import 'package:dartz/dartz.dart';
import 'package:netflix_app/domian/core/failures/main_failure.dart';
import 'package:netflix_app/domian/hot_and_new_resp/model/hot_and_new_resp.dart';

abstract class HotAndNewService{
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();
}