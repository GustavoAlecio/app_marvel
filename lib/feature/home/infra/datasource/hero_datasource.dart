abstract class IHeroDatasource {
  Future<List> getHeroes(int offset);
  Future<List> getHeroesWithID(int id);
}
