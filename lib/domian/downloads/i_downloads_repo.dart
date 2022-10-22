import 'package:dartz/dartz.dart';
import 'package:netflix_app/domian/core/failures/main_failure.dart';
import 'package:netflix_app/domian/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
