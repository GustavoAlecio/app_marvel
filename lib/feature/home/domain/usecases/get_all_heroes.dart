import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/domain/repositories/hero_repository.dart';

abstract class IGetAllHeroes {
  Future<List<HeroEntity>> call();
}

class GetAllHeroes implements IGetAllHeroes {
  final IHeroRepository repository;

  GetAllHeroes(this.repository);

  @override
  Future<List<HeroEntity>> call() async {
    return repository.getAllHeroes();
  }
}
