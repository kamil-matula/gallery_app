import 'package:dio/dio.dart';
import 'package:gallery_app/network_services/network_service.dart';

class CommentsNetworkService {
  final NetworkService _networkService;
  CommentsNetworkService(this._networkService);

  Future<Response<dynamic>> getComments() async {
    return await _networkService.get('comments');
  }

  // TODO: Add other requests, e.g. for adding comment (if needed)
}
