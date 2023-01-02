import 'package:get_it/get_it.dart';
import 'package:go_plus/features/posters/data/data_source/local/poster_local_data_source_impl.dart';
import 'package:go_plus/features/posters/data/data_source/local/poster_local_datasource.dart';
import 'package:go_plus/features/posters/data/repository/poster_repository_impl.dart';
import 'package:go_plus/features/posters/domain/repository/poster_repository.dart';
import 'package:go_plus/features/posters/domain/usecases/add_poster_usecase.dart';
import 'package:go_plus/features/posters/domain/usecases/delete_poster_usecase.dart';
import 'package:go_plus/features/posters/domain/usecases/get_all_poster.dart';
import 'package:go_plus/features/posters/domain/usecases/update_Poster_usecase.dart';
import 'package:go_plus/features/posters/presintation/view_models/poster_view_model/poster_bloc/poster_bloc.dart';


final  gitIt = GetIt.instance;
Future<void> init() async {
  /// Feature poster
  // Bloc
  gitIt.registerFactory(() => PosterBloc(
      getAllPoster: gitIt(),
      addPoster: gitIt(),
      deletePoster: gitIt(),
      updatePoster: gitIt()));
  // UseCase
  gitIt.registerLazySingleton(() => GetAllPosterUseCase(gitIt()));
  gitIt.registerLazySingleton(() => AddPosterUseCase(gitIt()));
  gitIt.registerLazySingleton(() => UpdatePosterUseCase(gitIt()));
  gitIt.registerLazySingleton(() => DeletePosterUseCase(gitIt()));
  // Repository
  gitIt.registerLazySingleton<PosterRepository>(() => PosterRepositoryImpl(posterDataSource: gitIt()));
  //DataSours
  gitIt.registerLazySingleton<PosterDataSource>(() => PosterLocalDataSourceImpl(databaseHelper: gitIt()));


}
