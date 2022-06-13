import 'package:app_marvel/core/domain/connectivity_service.dart';
import 'package:app_marvel/feature/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/domain/entities/value_object/quadrinhos.dart';
import 'package:app_marvel/feature/domain/repositories/hero_repository.dart';
import 'package:app_marvel/feature/external/marvel_dio.dart';
import 'package:app_marvel/feature/infra/datasource/hero_datasource.dart';
import 'package:mocktail/mocktail.dart';

class HeroRepositoryMock extends Mock implements IHeroRepository {}

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

class HeroEntityMock extends Mock implements HeroEntity {}

class QuadrinhosMock extends Mock implements Quadrinhos {}

class IHeroDatasourceMock extends Mock implements IHeroDatasource {}

class MarvelDioDatasourceMock extends Mock implements MarvelDioDatasource {}
