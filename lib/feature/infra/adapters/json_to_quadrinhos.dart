import 'package:app_marvel/feature/domain/entities/value_object/quadrinhos.dart';

class JsonToQuadrinhos {
  static Quadrinhos fromMap(dynamic json) {
    return Quadrinhos(
      id: json["id"],
      name: json.containsKey('title') ? json["title"] : '',
      thumbnail: json.containsKey('thumbnail')
          ? json['thumbnail']["path"] +
              "/detail." +
              json['thumbnail']["extension"]
          : null,
      description: json.containsKey('description') ? json["description"] : null,
      path: json["resourceURI"],
    );
  }
}
