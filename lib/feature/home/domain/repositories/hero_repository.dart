import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IHeroRepository {
  Future<Either<Failure, List<HeroEntity>>>getAllHeroes();
}
