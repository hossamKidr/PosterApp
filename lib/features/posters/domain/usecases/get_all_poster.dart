
import 'package:dartz/dartz.dart';
import 'package:go_plus/core/error/failures.dart';


import '../entitis/poster_entiti.dart';
import '../repository/poster_repository.dart';

class GetAllPosterUseCase{
PosterRepository posterRepository;

GetAllPosterUseCase(this.posterRepository);

Future<Either<Failure,List<Poster>>>call()async{
  return await posterRepository.getAllPoster();
}
}