import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/dependency_injection.dart';
import 'package:gallery_app/l10n/app_localizations_context.dart';
import 'package:gallery_app/views/comments_tab/comments_tab.dart';
import 'package:gallery_app/views/comments_tab/cubit/comments_cubit.dart';
import 'package:gallery_app/views/main_page/cubit/bottom_navigation_bar_cubit.dart';
import 'package:gallery_app/views/photos_tab/cubit/photos_cubit.dart';
import 'package:gallery_app/views/photos_tab/photos_tab.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavigationBarCubit()),
        BlocProvider(create: (_) => kiwi<PhotosCubit>()),
        BlocProvider(create: (_) => kiwi<CommentsCubit>()),
      ],
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<BottomNavigationBarCubit, int>(
          builder: (_, currentIndex) {
            return Text(currentIndex == 0
                ? context.texts.photosTab
                : context.texts.commentsTab);
          },
        ),
      ),
      body: BlocBuilder<BottomNavigationBarCubit, int>(
        builder: (context, currentIndex) {
          if (currentIndex == 0) {
            return const PhotosTab();
          } else {
            return const CommentsTab();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationBarCubit, int>(
        builder: (context, currentIndex) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<BottomNavigationBarCubit>().changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.photo),
                label: context.texts.photosTab,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.comment),
                label: context.texts.commentsTab,
              ),
            ],
          );
        },
      ),
    );
  }
}
