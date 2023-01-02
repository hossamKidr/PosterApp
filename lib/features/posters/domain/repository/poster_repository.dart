import 'package:dartz/dartz.dart';
import 'package:go_plus/core/error/failures.dart';



import '../entitis/poster_entiti.dart';

abstract class PosterRepository{
  Future<Either<Failure,List<Poster>>>getAllPoster();
  Future<Either<Failure,Unit>>addPoster(Poster poster);
  Future<Either<Failure,Unit>>deletePoster(int posterId);
  Future<Either<Failure,Unit>>updatePoster(Poster poster);
}