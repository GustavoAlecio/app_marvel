import 'package:app_marvel/feature/home/presenter/routes/app_pages.dart';
import 'package:app_marvel/feature/home/presenter/viewmodel/home_viewmodel.dart';
import 'package:app_marvel/feature/home/presenter/views/detalhe_hero_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _vm = GetIt.I<HomeViewModel>();
  @override
  void initState() {
    super.initState();
    _vm.getHeroes(0);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/images/marvel_logo.png'),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Observer(builder: (_) {
            return CupertinoScrollbar(
              controller: _vm.scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ListView.builder(
                  controller: _vm.scrollController,
                  itemCount: _vm.heroList.isNotEmpty ? _vm.heroList.length : 10,
                  itemBuilder: (BuildContext context, index) {
                    return !_vm.isLoading
                        ? CustomCard(
                            vm: _vm,
                            index: index,
                          )
                        : const CustomCardLoading();
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required HomeViewModel vm,
    required this.index,
  })  : _vm = vm,
        super(key: key);

  final HomeViewModel _vm;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 500,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 3,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Image.network(
                  _vm.heroList[index].imageSmall,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 12),
                    child: Text(
                      _vm.heroList[index].name,
                      maxLines: 3,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      _vm.heroList[index].realName ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextButton(
                        onPressed: () {
                          Get.to(
                              () =>
                                  DetalhesHeroPage(id: _vm.heroList[index].id),
                              transition: Transition.rightToLeft);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Mais informações',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.chevron_right_sharp,
                                  color: Colors.black),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCardLoading extends StatelessWidget {
  const CustomCardLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[500]!,
      baseColor: Colors.grey[100]!,
      child: SizedBox(
          height: 200,
          child: Card(
            color: const Color.fromARGB(68, 158, 158, 158),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          )),
    );
  }
}
