import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/domain/entities/value_object/quadrinhos.dart';
import 'package:app_marvel/feature/domain/repositories/hero_repository.dart';
import 'package:app_marvel/feature/infra/adapters/json_to_hero.dart';
import 'package:app_marvel/feature/infra/adapters/json_to_quadrinhos.dart';
import 'package:app_marvel/feature/infra/datasource/hero_datasource.dart';
import 'package:dartz/dartz.dart';

class HeroRepository implements IHeroRepository {
  final IHeroDatasource datasource;

  HeroRepository({required this.datasource});

  @override
  Future<Either<Failure, List<HeroEntity>>> getHeroes(int offset) async {
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
      HeroEntity lista = response.map(JsonToHero.fromMap).first;
      return Right(lista);
    } catch (e) {
      return Left(QueryError(message: FailureMessage.queryErrorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Quadrinhos>>> getComics(
      int id, int offset) async {
    try {
      final response = await datasource.getComics(id, offset);
      List<Quadrinhos> quadrinhos =
          response.map(JsonToQuadrinhos.fromMap).toList();
      return Right(quadrinhos);
    } catch (e) {
      return Left(QueryError(message: FailureMessage.queryErrorMessage));
    }
  }
}
