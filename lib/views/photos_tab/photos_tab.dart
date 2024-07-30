import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/dependency_injection.dart';
import 'package:gallery_app/models/photo.dart';
import 'package:gallery_app/views/photos_details_page/photos_details_page.dart';
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
          return RefreshIndicator(
            onRefresh: () async => await kiwi<PhotosCubit>().loadPhotos(),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
              padding: const EdgeInsets.all(8.0),
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                Photo photo = state.photos[index];
                return _tile(context, photo);
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _tile(BuildContext context, Photo photo) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PhotosDetailsPage(photo: photo),
          ),
        );
      },
      child: CachedNetworkImage(
        imageUrl: photo.thumbnailUrl,
        placeholder: (_, __) => const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (_, __, ___) => const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
