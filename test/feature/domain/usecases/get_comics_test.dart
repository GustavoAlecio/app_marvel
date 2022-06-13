// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/domain/entities/value_object/quadrinhos.dart';
import 'package:app_marvel/feature/domain/usecases/get_comics.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/mocks.dart';

void main() {
  //instancia dos Mocks
  final repository = HeroRepositoryMock();
  final quadrinhos = QuadrinhosMock();
  final connectivity = ConnectivityServiceMock();

  test(
      'Quando realizar a query,deve retornar uma lista de Quadrinhos dentro de um Right',
      () async {
    //
    when(() => connectivity.isOnline())
        .thenAnswer((invocation) => Future.value(true));
    when(() => repository.getComics(0, 0))
        .thenAnswer((_) => Future.value(Right([quadrinhos])));
    final usecase =
        GetComics(repository: repository, connectivityService: connectivity);

    final result = await usecase.call(id: 0, offset: 0);

    expect(result, isA<Right>());
    var resultFold;
    result.fold((l) => resultFold = l, (r) => resultFold = r);
    expect(resultFold, isA<List<Quadrinhos>>());
  });

  test('Quando realizar a query, deve retornar um Failure', () async {
    when(() => connectivity.isOnline())
        .thenAnswer((invocation) => Future.value(true));
    when(() => repository.getComics(0, 0)).thenAnswer((_) => Future.value(
        Left(QueryError(message: FailureMessage.queryErrorMessage))));

    final usecase =
        GetComics(repository: repository, connectivityService: connectivity);
    final result = await usecase.call(id: 0, offset: 0);

    expect(result, isA<Left>());
    var resultFold;
    result.fold((l) => resultFold = l, (r) => resultFold = r);
    expect(resultFold, isA<QueryError>());
  });
}
