import 'package:app_marvel/core/inject/inject.dart';
import 'package:app_marvel/feature/home/presenter/routes/app_pages.dart';
import 'package:app_marvel/feature/home/presenter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInject();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marvel Heroes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.homePage,
        getPages: AppPages.routes,
      ),
    );
  }
}
