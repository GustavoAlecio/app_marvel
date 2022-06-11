import 'package:app_marvel/core/utils/toast.dart';
import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/domain/usecases/get_all_heroes.dart';
import 'package:app_marvel/feature/home/domain/usecases/get_hero_with_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  _HomeViewModelBase() {
    scrollController.addListener(() {
      if (isReadyGetMoreHeroes) {
        setOffsetHeroList(20);
        getHeroes(offSetHeroList);
      }
    });
  }
  @observable
  bool isLoading = false;

  @observable
  List<HeroEntity> heroList = [];

  @observable
  HeroEntity? heroEntity;

  @observable
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  @observable
  int offSetHeroList = 0;

  @action
  setOffsetHeroList(int valor) => offSetHeroList += valor;

  @action
  Future<void> getHeroes(int offset) async {
    isLoading = true;
    final IGetAllHeroes usecase = GetIt.I<IGetAllHeroes>();
    var list = await usecase(offset);
    list.fold(
        (l) => toastError(message: l.message), (r) => heroList += List.from(r));
    isLoading = false;
  }

  @action
  Future<void> getHeroesWithID(int id) async {
    isLoading = true;
    final IGetHeroWithID usecase = GetIt.I<IGetHeroWithID>();
    var list = await usecase(id);
    list.fold((l) => toastError(message: l.message), (r) => heroEntity = r);
    isLoading = false;
  }

  @computed
  bool get isReadyGetMoreHeroes =>
      scrollController.offset == scrollController.position.maxScrollExtent;
}
