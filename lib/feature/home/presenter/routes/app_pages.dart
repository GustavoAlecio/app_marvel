import 'package:app_marvel/feature/home/presenter/routes/routes.dart';
import 'package:app_marvel/feature/home/presenter/views/detalhe_hero_page.dart';
import 'package:app_marvel/feature/home/presenter/views/home_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(name: Routes.homePage, page: () => const HomePage()),
    GetPage(
        name: Routes.detalhesHeroPage, page: () => const DetalhesHeroPage()),
  ];
}