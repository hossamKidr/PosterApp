import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_plus/core/error/failures.dart';
import 'package:go_plus/features/posters/domain/entitis/poster_entiti.dart';

import '../../../../../../core/error/app_message.dart';
import '../../../../../../core/failures_message.dart';

import '../../../../domain/usecases/add_poster_usecase.dart';
import '../../../../domain/usecases/delete_poster_usecase.dart';
import '../../../../domain/usecases/get_all_poster.dart';
import '../../../../domain/usecases/update_Poster_usecase.dart';

part 'poster_event.dart';
part 'poster_state.dart';

class PosterBloc extends Bloc<PosterEvent, PosterState> {
  GetAllPosterUseCase getAllPoster;
  AddPosterUseCase addPoster;
  UpdatePosterUseCase updatePoster;
  DeletePosterUseCase deletePoster;

  PosterBloc(
      {required this.getAllPoster, required this.addPoster,required this.updatePoster,required this.deletePoster})
      : super(PosterInitial()) {
    on<PosterEvent>((event, emit) async {
      if (event is GetAllPosterEvent) {
        emit(LoadingPosterState());
        final failureOrPoster = await getAllPoster();
        failureOrPoster.fold((failure) {
          emit(ErrorPosterState(errorMessage(failure)));
        }, (poster) {});
      } else if (event is AddPosterEvent) {
        emit(LoadingPosterState());
        final failureOrPoster = await addPoster(event.poster);
        failureOrPoster.fold((failure) {
          emit(ErrorPosterState(errorMessage(failure)));
        }, (_) {
          emit(AddUpdateDeleteMessageState(AppMessage.ADD_SUCCESS_MESSAGE));
        });
      } else if (event is UpdatePosterEvent) {
        emit(LoadingPosterState());
        final failureOrPoster = await updatePoster(event.poster);
        failureOrPoster.fold((failure) {
          emit(ErrorPosterState(errorMessage(failure)));
        }, (_) {
          emit(AddUpdateDeleteMessageState(AppMessage.UPDATE_SUCCESS_MESSAGE));
        });
      } else if (event is DeletePosterEvent) {
        emit(LoadingPosterState());
        final failureOrPoster = await deletePoster(event.posterId);
        failureOrPoster.fold((failure) {
          emit(ErrorPosterState(errorMessage(failure)));
        }, (_) {
          emit(AddUpdateDeleteMessageState(AppMessage.DELETE_SUCCESS_MESSAGE));
        });
      }
    });
  }
}

String errorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case EmptyCacheFailure:
      return AppMessageFailure.EMPTY_CACHE_MESSAGE;
    case NoAdditionPosterFailure:
      return AppMessageFailure.ADD_MESSAGE_FAILURE;
    case NoUpdatedPosterFailure:
      return AppMessageFailure.UPDATE_MESSAGE_FAILURE;
    case NoDeletedPosterFailure:
      return AppMessageFailure.DELETE_MESSAGE_FAILURE;
    default:
      return AppMessageFailure.DEFAULT_MESSAGE;
  }
}
