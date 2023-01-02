import 'package:dartz/dartz.dart';

import '../../models/poster_model.dart';

abstract class PosterDataSource {
 Future<List<PosterModel>> getAllPoster();
 Future<Unit> addPoster(PosterModel posterModel);
 Future<Unit> deletePoster(int posterId);
 Future<Unit> updatePoster(PosterModel posterModel);
}

