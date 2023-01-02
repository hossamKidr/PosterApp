import 'package:dartz/dartz.dart';

import 'package:go_plus/core/error/failures.dart';
import 'package:go_plus/features/posters/data/data_source/local/poster_local_datasource.dart';
import 'package:go_plus/features/posters/data/models/poster_model.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entitis/poster_entiti.dart';
import '../../domain/repository/poster_repository.dart';

class PosterRepositoryImpl implements PosterRepository {
  PosterDataSource posterDataSource;

  PosterRepositoryImpl({required this.posterDataSource});

  @override
  Future<Either<Failure, Unit>> addPoster(Poster poster) async {
    final PosterModel posterModel = PosterModel(
        numberPlates: poster.numberPlates,
        serialNumber: poster.serialNumber,
        id: poster.id);
    try {
      await posterDataSource.addPoster(posterModel);
      return Right(unit);
    } on NoAdditionPosterException {
      return Left(NoAdditionPosterFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePoster(int posterId)async {
    try{
      await posterDataSource.deletePoster(posterId);
      return Right(unit);
    } on NoDeletedPosterException{
      return Left(NoDeletedPosterFailure());
    }
  }

  @override
  Future<Either<Failure, List<Poster>>> getAllPoster()async {
    List<PosterModel>posters = [];
    try{
    posters =   await posterDataSource.getAllPoster();
      return Right(posters);
    }on EmptyCacheException{
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePoster(Poster poster)async {
    final PosterModel posterModel = PosterModel(
        numberPlates: poster.numberPlates,
        serialNumber: poster.serialNumber,
        id: poster.id);
    try {
      await posterDataSource.updatePoster(posterModel);
      return Right(unit);
    } on NoUpdatedPosterException {
      return Left(NoUpdatedPosterFailure());
    }
  }
}
