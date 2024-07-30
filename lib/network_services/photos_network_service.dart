import 'package:dio/dio.dart';
import 'package:gallery_app/network_services/network_service.dart';

class PhotosNetworkService {
  final NetworkService _networkService;
  PhotosNetworkService(this._networkService);

  Future<Response<dynamic>> getPhotos() async {
    return await _networkService.get('photos');
  }

  // TODO: Add other requests, e.g. for adding photo (if needed)
}
