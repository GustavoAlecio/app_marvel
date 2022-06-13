import 'package:app_marvel/core/domain/connectivity_service.dart';
import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/domain/repositories/hero_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetHeroWithID {
  Future<Either<Failure, HeroEntity>> call(int id);
}

class GetHeroWithID implements IGetHeroWithID {
  final IHeroRepository repository;
  final ConnectivityService connectivityService;

  GetHeroWithID({required this.repository, required this.connectivityService});

  @override
  Future<Either<Failure, HeroEntity>> call(int id) async {
    final isOnline = await connectivityService.isOnline();
    if (!isOnline) {
      return Left(
          ConnectionError(message: FailureMessage.connectionErrorMessage));
    }
    return repository.getHeroWithId(id);
  }
}
