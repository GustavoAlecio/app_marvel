import 'package:app_marvel/core/domain/connectivity_service.dart';
import 'package:app_marvel/core/errors/errors.dart';
import 'package:app_marvel/core/errors/failure.dart';
import 'package:app_marvel/feature/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/domain/repositories/hero_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetAllHeroes {
  Future<Either<Failure, List<HeroEntity>>> call(int offset);
}

class GetAllHeroes implements IGetAllHeroes {
  final IHeroRepository repository;
  final ConnectivityService connectivityService;

  GetAllHeroes({required this.repository, required this.connectivityService});

  @override
  Future<Either<Failure, List<HeroEntity>>> call(int offset) async {
    final isOnline = await connectivityService.isOnline();
    if (!isOnline) {
      return Left(
          ConnectionError(message: FailureMessage.connectionErrorMessage));
    }
    return repository.getHeroes(offset);
  }
}
