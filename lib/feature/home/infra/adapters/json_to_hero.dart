import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';

class JsonToHero {
  static HeroEntity fromMap(dynamic json) {
    return HeroEntity(
      id: json["id"],
      name: json["name"],
      image: 'thumbnail',
    );
  }
}
