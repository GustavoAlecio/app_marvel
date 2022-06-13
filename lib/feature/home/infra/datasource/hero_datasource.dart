import 'package:app_marvel/feature/home/domain/entities/value_object/quadrinhos.dart';

abstract class IHeroDatasource {
  Future<List> getHeroes(int offset);
  Future<List> getHeroesWithID(int id);
  Future<List> getComics(int id, int offset);
}
