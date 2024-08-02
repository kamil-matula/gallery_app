import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/l10n/app_localizations_context.dart';
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
            child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                final Comment comment = state.comments[index];
                return _tile(context, comment);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 10),
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
                Text(context.texts.somethingWentWrong),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => context.read<CommentsCubit>().loadComments(),
                  child: Text(context.texts.tryAgain),
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
    return Material(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: context.texts.email,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: comment.email,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            const Divider(),
            RichText(
              text: TextSpan(
                text: context.texts.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: comment.name,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: context.texts.body,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: comment.body,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
