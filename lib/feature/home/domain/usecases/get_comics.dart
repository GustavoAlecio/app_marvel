import 'package:app_marvel/core/domain/connectivity_service.dart';
import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/home/domain/entities/value_object/quadrinhos.dart';
import 'package:app_marvel/feature/home/domain/repositories/hero_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetComics {
  Future<Either<Failure, List<Quadrinhos>>> call(
      {required int id, required int offset});
}

class GetComics implements IGetComics {
  final IHeroRepository repository;
  final ConnectivityService connectivityService;

  GetComics({required this.repository, required this.connectivityService});

  @override
  Future<Either<Failure, List<Quadrinhos>>> call(
      {required int id, required offset}) async {
    final isOnline = await connectivityService.isOnline();
    if (!isOnline) {
      return Left(
          ConnectionError(message: FailureMessage.connectionErrorMessage));
    }
    return repository.getComics(id, offset);
  }
}
