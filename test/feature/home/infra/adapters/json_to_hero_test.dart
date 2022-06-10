import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/infra/adapters/json_to_hero.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('json to hero ...', () {
    final hero = JsonToHero.fromMap({
      "id": "125",
      "name": "dashda",
      "thumbnail": "daudahs",
    });

    expect(hero, isA<HeroEntity>());
  });
}
