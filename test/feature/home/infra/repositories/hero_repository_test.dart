import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/infra/datasource/hero_datasource.dart';
import 'package:app_marvel/feature/home/infra/repositories/hero_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class IHeroDatasourceMock extends Mock implements IHeroDatasource {}

void main() {
  test('hero repository ...', () async {
    final datasource = IHeroDatasourceMock();
    when(() => datasource.getHeroes(0)).thenAnswer((_) => Future.value([
          {
            "id": "125",
            "name": "dashda",
            "thumbnail": "daudahs",
          }
        ]));

    final repository = HeroRepository(datasource: datasource);
    final result = await repository.getHeroes(0);

    expect(result, isA<List<HeroEntity>>());
  });
}
