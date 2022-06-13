import 'package:app_marvel/feature/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/infra/adapters/json_to_hero.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('json to hero ...', () {
    final hero = JsonToHero.fromMap({
      "id": 123,
      "name": "dashda",
      "thumbnail": {
        "path": "daudahs",
        "extension": ".jpg",
      },
      "description": "dhsaudhaf",
      "comics": {
        "available": 0,
        "items": [
          {
            "id": 22506,
            "digitalId": 10949,
            "title": "Avengers: The Initiative (2007) #19",
            "issueNumber": 19,
            "variantDescription": "",
            "description":
                "Join 3-D MAN, CLOUD 9, KOMODO, HARDBALL, and heroes around America in the battle that will decide the fate of the planet and the future of the Initiative program. Will the Kill Krew Army win the day?",
            "modified": "2015-10-27T16:38:23-0400",
            "thumbnail": {
              "path":
                  "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806",
              "extension": "jpg"
            },
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22506",
          }
        ]
      },
    });

    expect(hero, isA<HeroEntity>());
  });
}
