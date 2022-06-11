import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';

class JsonToHero {
  static HeroEntity fromMap(dynamic json) {
    return HeroEntity(
      id: json["id"],
      name: json["name"].toString().split('(').first,
      imageSmall: json['thumbnail']["path"] +
          "/portrait_fantastic." +
          json['thumbnail']["extension"],
      imageBig: json['thumbnail']["path"] +
          "/detail." +
          json['thumbnail']["extension"],
      realName: json["name"].toString().split('(').length > 1
          ? json["name"]
              .toString()
              .split('(')
              .skip(1)
              .first
              .replaceFirstMapped(')', (match) => '')
          : null,
      description: json["description"],
    );
  }
}
