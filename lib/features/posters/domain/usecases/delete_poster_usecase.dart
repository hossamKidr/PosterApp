import 'package:dartz/dartz.dart';
import 'package:go_plus/core/error/failures.dart';

import '../repository/poster_repository.dart';

class DeletePosterUseCase{
  PosterRepository posterRepository;

  DeletePosterUseCase(this.posterRepository);

  Future<Either<Failure,Unit>>call(int posterId)async{
    return await posterRepository.deletePoster(posterId);
  }
}