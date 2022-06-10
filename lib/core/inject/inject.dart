import 'package:app_marvel/feature/home/domain/repositories/hero_repository.dart';
import 'package:app_marvel/feature/home/domain/usecases/get_all_heroes.dart';
import 'package:app_marvel/feature/home/external/marvel_dio.dart';
import 'package:app_marvel/feature/home/infra/datasource/hero_datasource.dart';
import 'package:app_marvel/feature/home/infra/repositories/hero_repository.dart';
import 'package:app_marvel/feature/home/presenter/viewmodel/home_viewmodel.dart';
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

  //datasource
  sl.registerLazySingleton<IHeroDatasource>(() => MarvelDioDatasource());

  //repositories
  sl.registerLazySingleton<IHeroRepository>(
      () => HeroRepository(datasource: sl()));

  //viewmodels
  sl.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}
