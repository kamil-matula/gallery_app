import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/repositories/comments_repository.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepository _repository;
  CommentsCubit(this._repository) : super(CommentsInitial()) {
    loadComments();
  }

  Future<void> loadComments() async {
    if (state is CommentsLoading) return;
    emit(CommentsLoading());

    try {
      // TODO: Add lazy loading, e.g. fetch by posts (if needed)
      final List<Comment> comments = await _repository.getAllComments();
      emit(CommentsLoaded(comments));
    } catch (_) {
      // TODO: Pass error to state (if needed)
      emit(CommentsError());
    }
  }
}
