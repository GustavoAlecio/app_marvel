import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/domain/entities/value_object/quadrinhos.dart';
import 'package:dartz/dartz.dart';

abstract class IHeroRepository {
  Future<Either<Failure, List<HeroEntity>>> getHeroes(int offset);
  Future<Either<Failure, HeroEntity>> getHeroWithId(int id);
  Future<Either<Failure, List<Quadrinhos>>> getComics(int id, int offset);
}
