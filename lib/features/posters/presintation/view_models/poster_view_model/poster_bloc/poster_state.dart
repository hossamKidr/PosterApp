part of 'poster_bloc.dart';


abstract class PosterState {}

class PosterInitial extends PosterState {}

class LoadingPosterState extends PosterState{}

class LoadedPosterState extends PosterState{
  List<Poster> poster;

  LoadedPosterState(this.poster);
}

class ErrorPosterState extends PosterState{
  String message;

  ErrorPosterState(this.message);
}
class AddUpdateDeleteMessageState extends PosterState{
  String message;
  AddUpdateDeleteMessageState(this.message);
}
