import 'package:dartz/dartz.dart';
import 'package:go_plus/features/posters/data/data_source/local/poster_local_datasource.dart';


import '../../models/poster_model.dart';
import 'database_helper.dart';
class PosterLocalDataSourceImpl implements PosterDataSource{
DatabaseHelper databaseHelper;
PosterLocalDataSourceImpl({required this.databaseHelper});
  @override
  Future<Unit> addPoster(PosterModel posterModel) async{
   await databaseHelper.insertPoster(posterModel);
    return Future.value(unit);
  }

  @override
  Future<Unit> deletePoster(int posterId)async {
   await databaseHelper.deletePoster(posterId);
    return Future.value(unit);
  }

  @override
  Future<List<PosterModel>> getAllPoster()async {
 return await databaseHelper.getPoser();

  }

  @override
  Future<Unit> updatePoster(PosterModel posterModel) {
    databaseHelper.updatePoster(posterModel);
    return Future.value(unit);
  }

}