import 'package:dio/dio.dart';
import 'package:gallery_app/models/photo.dart';
import 'package:gallery_app/network_services/photos_network_service.dart';

class PhotosRepository {
  final PhotosNetworkService _networkService;
  PhotosRepository(this._networkService);

  Future<List<Photo>> getAllPhotos() async {
    final Response<dynamic> response = await _networkService.getPhotos();
    return List<Photo>.from(response.data.map((json) => Photo.fromJson(json)));
  }

  // TODO: Add other requests, e.g. for adding photo (if needed)
}
