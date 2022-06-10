import 'dart:math';

import 'package:app_marvel/feature/home/external/marvel_dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('marvel dio ...', () async {
    final dio = MarvelDioDatasource();

    var result = await dio.getAllHeroes();
    print(result);
    expect(result, isA<List<Map>>());
  });
}
