import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';

abstract class IHeroRepository {
  Future<List<HeroEntity>> getAllHeroes();
}
