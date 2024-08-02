import 'package:dio/dio.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/network_services/comments_network_service.dart';

class CommentsRepository {
  final CommentsNetworkService _networkService;
  CommentsRepository(this._networkService);

  Future<List<Comment>> getAllComments() async {
    final Response<dynamic> response = await _networkService.getComments();
    return List<Comment>.from(
      response.data.map((json) => Comment.fromJson(json)),
    );
  }

  // TODO: Add other requests, e.g. for adding comment (if needed)
}
