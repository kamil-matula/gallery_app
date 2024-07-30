part of 'photos_cubit.dart';

@immutable
abstract class PhotosState {}

class PhotosInitial extends PhotosState {}

class PhotosLoading extends PhotosState {}

class PhotosLoaded extends PhotosState {
  final List<Photo> photos;

  PhotosLoaded(this.photos);
}

class PhotosError extends PhotosState {}
