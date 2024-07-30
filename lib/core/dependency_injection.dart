import 'package:gallery_app/network_services/comments_network_service.dart';
import 'package:gallery_app/network_services/network_service.dart';
import 'package:gallery_app/network_services/photos_network_service.dart';
import 'package:gallery_app/repositories/photos_repository.dart';
import 'package:gallery_app/views/photos_tab/cubit/photos_cubit.dart';
import 'package:kiwi/kiwi.dart';

part 'dependency_injection.g.dart';

final KiwiContainer kiwi = KiwiContainer();
abstract class DependencyInjection {
  static void init() => _$DependencyInjection().configure();

  // Services:
  @Register.singleton(NetworkService)
  @Register.singleton(CommentsNetworkService)
  @Register.singleton(PhotosNetworkService)
  @Register.singleton(PhotosRepository)

  // Cubits:
  @Register.factory(PhotosCubit)
  void configure();
}
