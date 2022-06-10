// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/domain/repositories/hero_repository.dart';
import 'package:app_marvel/feature/home/domain/usecases/get_all_heroes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HeroRepositoryMock extends Mock implements IHeroRepository {}

class HeroEntityMock extends Mock implements HeroEntity {}

void main() {
  test('deve retornar uma lista de HeroEntity', () async {
    final repository = HeroRepositoryMock();
    final entity = HeroEntityMock();
    when(() => repository.getAllHeroes())
        .thenAnswer((_) => Future.value(Right([entity])));
    final usecase = GetAllHeroes(repository);

    final result = await usecase.call();

    expect(result, isA<Right>());
    var resultFold;
    result.fold((l) => resultFold = l, (r) => resultFold = r);
    expect(resultFold, isA<List<HeroEntity>>());
  });

  
  test('deve retornar um Failure', () async {
    final repository = HeroRepositoryMock();
    when(() => repository.getAllHeroes()).thenAnswer((_) => Future.value(
        Left(QueryError(message: FailureMessage.queryErrorMessage))));
    final usecase = GetAllHeroes(repository);

    final result = await usecase.call();

    expect(result, isA<Left>());
    var resultFold;
    result.fold((l) => resultFold = l, (r) => resultFold = r);
    expect(resultFold, isA<QueryError>());
  });
}
