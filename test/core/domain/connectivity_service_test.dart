import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/domain/usecases/get_hero_with_id.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mocks.dart';

void main() {
  test('Quando chamar isOnline no GetHeroWithID.call(), deve retornar true',
      () async {
    final connectivityServiceMock = ConnectivityServiceMock();

    final repository = HeroRepositoryMock();
    final usecase = GetHeroWithID(
        repository: repository, connectivityService: connectivityServiceMock);
    when(() => connectivityServiceMock.isOnline())
        .thenAnswer((_) async => true);

    final result = await connectivityServiceMock.isOnline();

    expect(result, true);
  });
  test('Quando chamar isOnline GetHeroWithID.call(), deve retornar false',
      () async {
    final connectivityServiceMock = ConnectivityServiceMock();

    final repository = HeroRepositoryMock();
    final usecase = GetHeroWithID(
        repository: repository, connectivityService: connectivityServiceMock);
    when(() => connectivityServiceMock.isOnline())
        .thenAnswer((_) async => false);

    final result = await usecase.call(0);

    expect(result.leftMap((failure) => failure is ConnectionError),
        const Left(true));

    expect(result.fold((failure) => failure.message, id),
        FailureMessage.connectionErrorMessage);
  });
}
