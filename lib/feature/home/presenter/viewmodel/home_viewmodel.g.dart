// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
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

  late final _$getAllHeroesAsyncAction =
      AsyncAction('_HomeViewModelBase.getAllHeroes', context: context);

  @override
  Future getAllHeroes() {
    return _$getAllHeroesAsyncAction.run(() => super.getAllHeroes());
  }

  @override
  String toString() {
    return '''
heroList: ${heroList}
    ''';
  }
}
