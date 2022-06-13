// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/domain/usecases/get_all_heroes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/mocks.dart';

void main() {
  //instancia dos Mocks
  final repository = HeroRepositoryMock();
  final entity = HeroEntityMock();
  final connectivity = ConnectivityServiceMock();

  test(
      'Quando realizar a query,deve retornar uma lista de HeroEntity dentro de um Right',
      () async {
    //
    when(() => connectivity.isOnline())
        .thenAnswer((invocation) => Future.value(true));
    when(() => repository.getHeroes(0))
        .thenAnswer((_) => Future.value(Right([entity])));
    final usecase =
        GetAllHeroes(repository: repository, connectivityService: connectivity);

    final result = await usecase.call(0);

    expect(result, isA<Right>());
    var resultFold;
    result.fold((l) => resultFold = l, (r) => resultFold = r);
    expect(resultFold, isA<List<HeroEntity>>());
  });

  test('Quando realizar a query, deve retornar um Failure', () async {
    when(() => connectivity.isOnline())
        .thenAnswer((invocation) => Future.value(true));
    when(() => repository.getHeroes(0)).thenAnswer((_) => Future.value(
        Left(QueryError(message: FailureMessage.queryErrorMessage))));

    final usecase =
        GetAllHeroes(repository: repository, connectivityService: connectivity);
    final result = await usecase.call(0);

    expect(result, isA<Left>());
    var resultFold;
    result.fold((l) => resultFold = l, (r) => resultFold = r);
    expect(resultFold, isA<QueryError>());
  });
}
