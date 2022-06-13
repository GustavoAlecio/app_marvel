// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/domain/entities/hero_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/mocks.dart';

void main() {
  final resultQuery = {
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
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806",
            "extension": "jpg"
          },
          "resourceURI": "http://gateway.marvel.com/v1/public/comics/22506",
        }
      ]
    },
  };

  test('Quando realizar a query, deve retornar um List de HeroEntity',
      () async {
    final datasource = IHeroDatasourceMock();
    final repository = HeroRepositoryMock();
    final entity = HeroEntityMock();

    when(() => datasource.getHeroes(0))
        .thenAnswer((_) async => await Future.value([resultQuery]));
    when(() => repository.getHeroes(0))
        .thenAnswer((invocation) => Future.value(Right([entity])));
    final result = await repository.getHeroes(0);

    expect(result, isA<Right>());
    var resultFold;
    result.fold((l) => resultFold = l, (r) => resultFold = r);

    expect(resultFold, isA<List<HeroEntity>>());
  });
  test('Quando realizar a query, deve retornar um Failure', () async {
    final datasource = IHeroDatasourceMock();
    final repository = HeroRepositoryMock();

    when(() => datasource.getHeroes(0))
        .thenAnswer((_) async => await Future.value([resultQuery]));
    when(() => repository.getHeroes(0)).thenAnswer((invocation) => Future.value(
        Left(QueryError(message: FailureMessage.queryErrorMessage))));
    final result = await repository.getHeroes(0);

    expect(result, isA<Left>());
    var resultFold;
    result.fold((l) => resultFold = l, (r) => resultFold = r);

    expect(resultFold, isA<QueryError>());
  });
}
