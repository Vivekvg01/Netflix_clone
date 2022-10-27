import 'package:dartz/dartz.dart';
import 'package:netflix_app/domian/core/failures/main_failure.dart';
import 'package:netflix_app/domian/search/model/search_respo/search_respo.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRespo>> searchmovies({
    required String movieQuery,
  });
}
