import 'package:app_marvel/feature/domain/repositories/hero_repository.dart';
import 'package:app_marvel/feature/domain/usecases/get_all_heroes.dart';
import 'package:app_marvel/feature/domain/usecases/get_comics.dart';
import 'package:app_marvel/feature/domain/usecases/get_hero_with_id.dart';
import 'package:app_marvel/feature/external/marvel_dio.dart';
import 'package:app_marvel/feature/infra/datasource/hero_datasource.dart';
import 'package:app_marvel/feature/infra/repositories/hero_repository.dart';
import 'package:app_marvel/feature/presenter/viewmodel/home_viewmodel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

import '../domain/connectivity_service.dart';

final sl = GetIt.I;

Future<void> initInject() async {
  //core
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<ConnectivityService>(
      () => ConnectivityServiceImpl(connectivity: sl()));

  //usecase
  sl.registerLazySingleton<IGetAllHeroes>(() => GetAllHeroes(
        repository: sl(),
        connectivityService: sl(),
      ));
  sl.registerLazySingleton<IGetHeroWithID>(() => GetHeroWithID(
        repository: sl(),
        connectivityService: sl(),
      ));
  sl.registerLazySingleton<IGetComics>(() => GetComics(
        repository: sl(),
        connectivityService: sl(),
      ));

  //datasource
  sl.registerLazySingleton<IHeroDatasource>(() => MarvelDioDatasource());

  //repositories
  sl.registerLazySingleton<IHeroRepository>(
      () => HeroRepository(datasource: sl()));

  //viewmodels
  sl.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}
