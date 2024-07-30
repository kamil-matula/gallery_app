import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/views/photos_tab/cubit/photos_cubit.dart';

class PhotosTab extends StatelessWidget {
  const PhotosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (context, state) {
        if (state is PhotosLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PhotosLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(state.photos[index].title);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
