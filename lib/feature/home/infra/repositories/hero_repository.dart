import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/domain/repositories/hero_repository.dart';
import 'package:app_marvel/feature/home/infra/adapters/json_to_hero.dart';
import 'package:app_marvel/feature/home/infra/datasource/hero_datasource.dart';

class HeroRepository implements IHeroRepository {
  final IHeroDatasource datasource;

  HeroRepository(this.datasource);

  @override
  Future<List<HeroEntity>> getAllHeroes() {
    final response = datasource.getAllHeroes();

    return response.then(_convert);
  }

  List<HeroEntity> _convert(List<Map> list) {
    return list.map(JsonToHero.fromMap).toList();
  }
}
