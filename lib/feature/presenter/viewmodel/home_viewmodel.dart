import 'package:app_marvel/core/utils/toast.dart';
import 'package:app_marvel/feature/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/domain/usecases/get_all_heroes.dart';
import 'package:app_marvel/feature/domain/usecases/get_comics.dart';
import 'package:app_marvel/feature/domain/usecases/get_hero_with_id.dart';
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
    scrollControllerComics.addListener(() {
      if (isReadyGetMoreComics) {
        getComics();
      }
    });
  }
  @observable
  bool isLoading = false;

  @observable
  bool isLoadingComics = false;

  @observable
  List<HeroEntity> heroList = [];

  @observable
  HeroEntity? heroEntity;

  @observable
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  @observable
  int offSetHeroList = 0;

  @observable
  ScrollController scrollControllerComics =
      ScrollController(initialScrollOffset: 0.0);

  @computed
  bool get isReadyGetMoreHeroes =>
      scrollController.offset == scrollController.position.maxScrollExtent;

  @computed
  bool get isReadyGetMoreComics =>
      scrollControllerComics.offset ==
          scrollControllerComics.position.maxScrollExtent &&
      heroEntity!.quadrinhos.length < heroEntity!.totalComics;

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
    final IGetHeroWithID usecase = GetIt.I<IGetHeroWithID>();
    var list = await usecase(id);

    list.fold((l) => toastError(message: l.message), (r) async {
      isLoadingComics = true;
      heroEntity = r;
      heroEntity!.quadrinhos = List.from([]);

      await getComics();
      isLoadingComics = false;
    });
  }

  @action
  Future getComics() async {
    isLoading = true;
    final IGetComics usecase = GetIt.I<IGetComics>();
    final quadrinho = await usecase(
      id: heroEntity!.id,
      offset: heroEntity!.quadrinhos.length,
    );
    await quadrinho.fold((l) => toastError(message: l.message), (r) {
      heroEntity!.quadrinhos += List.from(r);
    });
    heroEntity!.quadrinhos = List.from(heroEntity!.quadrinhos);
    isLoading = false;
  }
}
