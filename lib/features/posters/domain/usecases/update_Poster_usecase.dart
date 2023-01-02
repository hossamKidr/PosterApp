import 'package:dartz/dartz.dart';
import 'package:go_plus/core/error/failures.dart';

import '../entitis/poster_entiti.dart';
import '../repository/poster_repository.dart';

class UpdatePosterUseCase{
  PosterRepository posterRepository;

  UpdatePosterUseCase(this.posterRepository);

 Future<Either<Failure,Unit>> call(Poster poster)async{
    return await posterRepository.updatePoster(poster);
  }
}