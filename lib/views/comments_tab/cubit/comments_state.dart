part of 'comments_cubit.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<Comment> comments;

  CommentsLoaded(this.comments);
}

class CommentsError extends CommentsState {}
