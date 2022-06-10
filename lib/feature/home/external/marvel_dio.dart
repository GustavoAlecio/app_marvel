import 'dart:convert';

import 'package:app_marvel/feature/home/infra/datasource/hero_datasource.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

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
  Future<List<Map>> getAllHeroes() async {
    String ts = DateTime.now().microsecondsSinceEpoch.toString();

    var response = await dio.get("/v1/public/characters", queryParameters: {
      "apikey": "a069735debbdd7bb859ca955b7dc1103",
      "hash": generateMd5("a069735debbdd7bb859ca955b7dc1103",
          "d1270e4324b7941e1ea2a106fb51a344f1da7dfc", ts),
      "ts": ts,
      // "limit": "10",
    });
    print(response.data["data"]["results"]);
    return response.data["data"]["results"];
  }
}

String generateMd5(String publicKey, privateKey, ts) {
  return md5.convert(utf8.encode(ts + privateKey + publicKey)).toString();
}
// response = await Dio().get(url, queryParameters: {
//     "apikey": publicKey,
//     "hash": hash,
//     "ts": timestamp,
//     "nameStartsWith": searchTerm,
//     "page" : 10
//   });