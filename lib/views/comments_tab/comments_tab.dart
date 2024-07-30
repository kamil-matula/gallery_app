import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/views/comments_tab/cubit/comments_cubit.dart';

class CommentsTab extends StatelessWidget {
  const CommentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (context, state) {
        if (state is CommentsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CommentsLoaded) {
          return RefreshIndicator(
            onRefresh: () async =>
            await context.read<CommentsCubit>().loadComments(),
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                Comment comment = state.comments[index];
                return _tile(context, comment);
              },
              shrinkWrap: true,
            ),
          );
        }

        if (state is CommentsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Something went wrong. Please try again.'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => context.read<CommentsCubit>().loadComments(),
                  child: const Text('Try again'),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _tile(BuildContext context, Comment comment) {
    return Column(
      children: [
        Text('Name: ${comment.name}'),
        Text('Email: ${comment.email}'),
        Text('Body: ${comment.body}'),
      ],
    );
  }
}
