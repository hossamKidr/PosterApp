part of 'poster_bloc.dart';


abstract class PosterEvent {}

class GetAllPosterEvent extends PosterEvent{}
class AddPosterEvent extends PosterEvent{
  Poster poster;
  AddPosterEvent(this.poster);
}
class UpdatePosterEvent extends PosterEvent{
  Poster poster;
  UpdatePosterEvent(this.poster);
}
class DeletePosterEvent extends PosterEvent{
  int posterId;
  DeletePosterEvent(this.posterId);
}