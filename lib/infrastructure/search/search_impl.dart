import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domian/search/model/search_respo/search_respo.dart';
import 'package:netflix_app/domian/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domian/search/search_service.dart';

import '../../domian/core/api_endpoints.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchRespo>> searchmovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchRespo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverfailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
