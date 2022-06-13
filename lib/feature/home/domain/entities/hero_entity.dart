import 'package:app_marvel/feature/home/domain/entities/value_object/quadrinhos.dart';
import 'package:equatable/equatable.dart';

class HeroEntity extends Equatable {
  final int id;
  final String name;
  final String imageSmall;
  final String imageBig;
  final String? realName;
  final String? description;
  final int totalComics;
  late List<Quadrinhos> quadrinhos = [];

  HeroEntity({
    required this.id,
    required this.name,
    required this.imageSmall,
    required this.imageBig,
    this.realName,
    this.description,
    required this.totalComics,
    required this.quadrinhos,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageSmall,
        imageBig,
        realName,
        description,
        totalComics,
        quadrinhos,
      ];
}
