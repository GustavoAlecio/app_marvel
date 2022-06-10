import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/domain/repositories/hero_repository.dart';
import 'package:app_marvel/feature/home/domain/usecases/get_all_heroes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HeroRepositoryMock extends Mock implements IHeroRepository {}

class HeroEntityMock extends Mock implements HeroEntity {}

void main() {
  test('deve retornar uma lista de HeroEntity', () async {
    final repository = HeroRepositoryMock();
    final entity = HeroEntityMock();
    when(() => repository.getAllHeroes())
        .thenAnswer((_) => Future.value([entity]));
    final usecase = GetAllHeroes(repository);

    final result = await usecase.call();

    expect(result, isA<List<HeroEntity>>());
  });
}
