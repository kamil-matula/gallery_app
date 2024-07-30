import 'package:gallery_app/network_services/comments_network_service.dart';
import 'package:gallery_app/network_services/network_service.dart';
import 'package:gallery_app/network_services/photos_network_service.dart';
import 'package:kiwi/kiwi.dart';

part 'dependency_injection.g.dart';

final KiwiContainer kiwi = KiwiContainer();

abstract class DependencyInjection {
  static void init() => _$DependencyInjection().configure();

  @Register.singleton(NetworkService)
  @Register.singleton(CommentsNetworkService)
  @Register.singleton(PhotosNetworkService)
  void configure();
}
