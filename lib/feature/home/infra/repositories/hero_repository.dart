import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/domain/repositories/hero_repository.dart';
import 'package:app_marvel/feature/home/infra/adapters/json_to_hero.dart';
import 'package:app_marvel/feature/home/infra/datasource/hero_datasource.dart';
import 'package:dartz/dartz.dart';

class HeroRepository implements IHeroRepository {
  final IHeroDatasource datasource;

  HeroRepository({required this.datasource});

  @override
  Future<Either<Failure, List<HeroEntity>>> getHeroes(int offset) async {
    // final response = await datasource.getHeroes(offset);
    // List<HeroEntity> lista = response.map(JsonToHero.fromMap).toList();
    // return Right(lista);
    try {
      final response = await datasource.getHeroes(offset);
      List<HeroEntity> lista = response.map(JsonToHero.fromMap).toList();
      return Right(lista);
    } catch (e) {
      return Left(QueryError(message: FailureMessage.queryErrorMessage));
    }
  }

  @override
  Future<Either<Failure, HeroEntity>> getHeroWithId(int id) async {
    try {
      final response = await datasource.getHeroesWithID(id);
      HeroEntity lista = response.map(JsonToHero.fromMap).toList().first;
      return Right(lista);
    } catch (e) {
      return Left(QueryError(message: FailureMessage.queryErrorMessage));
    }
  }
}
