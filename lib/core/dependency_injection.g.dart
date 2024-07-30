// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependency_injection.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$DependencyInjection extends DependencyInjection {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => NetworkService())
      ..registerSingleton(
          (c) => CommentsNetworkService(c.resolve<NetworkService>()))
      ..registerSingleton(
          (c) => PhotosNetworkService(c.resolve<NetworkService>()))
      ..registerSingleton(
          (c) => PhotosRepository(c.resolve<PhotosNetworkService>()))
      ..registerFactory((c) => PhotosCubit(c.resolve<PhotosRepository>()));
  }
}
