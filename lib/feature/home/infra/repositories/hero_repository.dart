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
  Future<Either<Failure, List<HeroEntity>>> getAllHeroes() async {
    final response = await datasource.getAllHeroes();
    List<HeroEntity> lista = response.map(JsonToHero.fromMap).toList();
    print(lista);
    return Right(lista);
    // try {
    //   final response = await datasource.getAllHeroes();
    //   var lista = _convert(response);
    //   return Right(lista);
    // } catch (e) {
    //   return Left(QueryError(message: FailureMessage.queryErrorMessage));
    // }
  }

  List<HeroEntity> _convert(List<Map> list) {
    return list.map(JsonToHero.fromMap).toList();
  }
}
