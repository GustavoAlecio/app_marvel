import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mocks.dart';

void main() {
  test('Quando realizar a query de getHeroes, deve retornar uma lista de Map',
      () async {
    final dio = MarvelDioDatasourceMock();
    final List<Map> list = [];

    when(() => dio.getHeroes(0)).thenAnswer((invocation) => Future.value(list));

    var result = await dio.getHeroes(0);

    expect(result, isA<List<Map>>());
  });

  test('Quando realizar a query getHeroesWithID, deve retornar uma lista',
      () async {
    final dio = MarvelDioDatasourceMock();
    final List list = [];

    when(() => dio.getHeroesWithID(0))
        .thenAnswer((invocation) => Future.value(list));

    var result = await dio.getHeroesWithID(0);

    expect(result, isA<List>());
  });

  test('Quando realizar a query getComics, deve retornar uma lista', () async {
    final dio = MarvelDioDatasourceMock();
    final List list = [];

    when(() => dio.getComics(0, 0))
        .thenAnswer((invocation) => Future.value(list));

    var result = await dio.getComics(0, 0);

    expect(result, isA<List>());
  });
}
