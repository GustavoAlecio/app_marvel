import 'package:equatable/equatable.dart';

class Quadrinhos extends Equatable {
  late int? id;
  late String? name;
  late String? description;
  late String? thumbnail;
  late String path;

  Quadrinhos({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    required this.path,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        thumbnail,
        path,
      ];
}
