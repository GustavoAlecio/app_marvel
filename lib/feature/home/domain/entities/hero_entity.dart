import 'package:app_marvel/feature/home/domain/entities/value_object/quadrinhos.dart';
import 'package:equatable/equatable.dart';

class HeroEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final String? realName;
  final String? description;
  final List<Quadrinhos>? quadrinhos;

  const HeroEntity({
    required this.id,
    required this.name,
    required this.image,
    this.realName,
    this.description,
    this.quadrinhos,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        realName,
        description,
        quadrinhos,
      ];
}
