import 'package:app_marvel/core/utils/toast.dart';
import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/domain/usecases/get_all_heroes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  _HomeViewModelBase() {
    getAllHeroes();
  }

  @observable
  List<HeroEntity> heroList = [];

  @action
  Future<void> getAllHeroes() async {
    final IGetAllHeroes usecase = GetIt.I<IGetAllHeroes>();
    var list = await usecase();
    list.fold(
        (l) => toastError(message: l.message), (r) => heroList = List.from(r));
    print(heroList.length);
  }
}
