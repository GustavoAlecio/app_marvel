import 'dart:convert';
import 'package:app_marvel/feature/home/infra/datasource/hero_datasource.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class MarvelDioDatasource implements IHeroDatasource {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://gateway.marvel.com:443',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: 'application/json',
    ),
  );

  @override
  Future<List> getHeroes(int offset) async {
    String ts = DateTime.now().microsecondsSinceEpoch.toString();

    var response = await dio.get("/v1/public/characters", queryParameters: {
      "apikey": "a069735debbdd7bb859ca955b7dc1103",
      "hash": generateMd5("a069735debbdd7bb859ca955b7dc1103",
          "d1270e4324b7941e1ea2a106fb51a344f1da7dfc", ts),
      "ts": ts,
      'offset': offset,
    });
    if (response.statusCode == 200) {
      List result = response.data["data"]["results"];
      return result;
    } else {
      throw Exception('Erro de consulta');
    }
  }

  @override
  Future<List> getHeroesWithID(int id) async {
    String ts = DateTime.now().microsecondsSinceEpoch.toString();

    var response = await dio.get("/v1/public/characters", queryParameters: {
      "apikey": "a069735debbdd7bb859ca955b7dc1103",
      "hash": generateMd5("a069735debbdd7bb859ca955b7dc1103",
          "d1270e4324b7941e1ea2a106fb51a344f1da7dfc", ts),
      "ts": ts,
      'id': id,
    });
    if (response.statusCode == 200) {
      List result = response.data["data"]["results"];
      return result;
    } else {
      throw Exception('Erro de consulta');
    }
  }
}

String generateMd5(String publicKey, privateKey, ts) {
  return md5.convert(utf8.encode(ts + privateKey + publicKey)).toString();
}
