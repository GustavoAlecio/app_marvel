// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  Computed<bool>? _$isReadyGetMoreHeroesComputed;

  @override
  bool get isReadyGetMoreHeroes => (_$isReadyGetMoreHeroesComputed ??=
          Computed<bool>(() => super.isReadyGetMoreHeroes,
              name: '_HomeViewModelBase.isReadyGetMoreHeroes'))
      .value;
  Computed<bool>? _$isReadyGetMoreComicsComputed;

  @override
  bool get isReadyGetMoreComics => (_$isReadyGetMoreComicsComputed ??=
          Computed<bool>(() => super.isReadyGetMoreComics,
              name: '_HomeViewModelBase.isReadyGetMoreComics'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingComicsAtom =
      Atom(name: '_HomeViewModelBase.isLoadingComics', context: context);

  @override
  bool get isLoadingComics {
    _$isLoadingComicsAtom.reportRead();
    return super.isLoadingComics;
  }

  @override
  set isLoadingComics(bool value) {
    _$isLoadingComicsAtom.reportWrite(value, super.isLoadingComics, () {
      super.isLoadingComics = value;
    });
  }

  late final _$heroListAtom =
      Atom(name: '_HomeViewModelBase.heroList', context: context);

  @override
  List<HeroEntity> get heroList {
    _$heroListAtom.reportRead();
    return super.heroList;
  }

  @override
  set heroList(List<HeroEntity> value) {
    _$heroListAtom.reportWrite(value, super.heroList, () {
      super.heroList = value;
    });
  }

  late final _$heroEntityAtom =
      Atom(name: '_HomeViewModelBase.heroEntity', context: context);

  @override
  HeroEntity? get heroEntity {
    _$heroEntityAtom.reportRead();
    return super.heroEntity;
  }

  @override
  set heroEntity(HeroEntity? value) {
    _$heroEntityAtom.reportWrite(value, super.heroEntity, () {
      super.heroEntity = value;
    });
  }

  late final _$scrollControllerAtom =
      Atom(name: '_HomeViewModelBase.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$offSetHeroListAtom =
      Atom(name: '_HomeViewModelBase.offSetHeroList', context: context);

  @override
  int get offSetHeroList {
    _$offSetHeroListAtom.reportRead();
    return super.offSetHeroList;
  }

  @override
  set offSetHeroList(int value) {
    _$offSetHeroListAtom.reportWrite(value, super.offSetHeroList, () {
      super.offSetHeroList = value;
    });
  }

  late final _$scrollControllerComicsAtom =
      Atom(name: '_HomeViewModelBase.scrollControllerComics', context: context);

  @override
  ScrollController get scrollControllerComics {
    _$scrollControllerComicsAtom.reportRead();
    return super.scrollControllerComics;
  }

  @override
  set scrollControllerComics(ScrollController value) {
    _$scrollControllerComicsAtom
        .reportWrite(value, super.scrollControllerComics, () {
      super.scrollControllerComics = value;
    });
  }

  late final _$getHeroesAsyncAction =
      AsyncAction('_HomeViewModelBase.getHeroes', context: context);

  @override
  Future<void> getHeroes(int offset) {
    return _$getHeroesAsyncAction.run(() => super.getHeroes(offset));
  }

  late final _$getHeroesWithIDAsyncAction =
      AsyncAction('_HomeViewModelBase.getHeroesWithID', context: context);

  @override
  Future<void> getHeroesWithID(int id) {
    return _$getHeroesWithIDAsyncAction.run(() => super.getHeroesWithID(id));
  }

  late final _$getComicsAsyncAction =
      AsyncAction('_HomeViewModelBase.getComics', context: context);

  @override
  Future<dynamic> getComics() {
    return _$getComicsAsyncAction.run(() => super.getComics());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  dynamic setOffsetHeroList(int valor) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setOffsetHeroList');
    try {
      return super.setOffsetHeroList(valor);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoadingComics: ${isLoadingComics},
heroList: ${heroList},
heroEntity: ${heroEntity},
scrollController: ${scrollController},
offSetHeroList: ${offSetHeroList},
scrollControllerComics: ${scrollControllerComics},
isReadyGetMoreHeroes: ${isReadyGetMoreHeroes},
isReadyGetMoreComics: ${isReadyGetMoreComics}
    ''';
  }
}
