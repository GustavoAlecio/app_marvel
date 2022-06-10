import 'package:app_marvel/core/inject/inject.dart';
import 'package:app_marvel/feature/home/presenter/routes/app_pages.dart';
import 'package:app_marvel/feature/home/presenter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInject();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Marvel Heroes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.homePage,
      getPages: AppPages.routes,

    );
  }
}
