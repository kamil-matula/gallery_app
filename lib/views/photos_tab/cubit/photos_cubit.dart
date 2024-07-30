import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/photo.dart';
import 'package:gallery_app/repositories/photos_repository.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  final PhotosRepository _repository;
  PhotosCubit(this._repository) : super(PhotosInitial()) {
    loadPhotos();
  }

  void loadPhotos() async {
    try {
      List<Photo> photos = await _repository.getAllPhotos();
      emit(PhotosLoaded(photos));
    } catch (_) {
      emit(PhotosError());
    }
  }
}
