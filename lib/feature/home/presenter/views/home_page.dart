import 'package:app_marvel/feature/home/presenter/viewmodel/home_viewmodel.dart';
import 'package:app_marvel/feature/home/presenter/views/detalhe_hero_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Observer(builder: (_) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
                child: Image.asset('assets/images/marvel_logo.png'),
              ),
              Expanded(
                child: CupertinoScrollbar(
                  controller: _vm.scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ListView.builder(
                      controller: _vm.scrollController,
                      itemCount:
                          _vm.heroList.isNotEmpty ? _vm.heroList.length : 10,
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
                ),
              ),
            ],
          ),
        );
      }),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 170,
      child: InkWell(
        onTap: () {
          Get.bottomSheet(
            
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: DetalhesHeroPage(
                id: _vm.heroList[index].id,
                size: MediaQuery.of(context).size,
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            elevation: 8,
            isScrollControlled: true,
            ignoreSafeArea: true,
            backgroundColor: Colors.white,
            barrierColor: Colors.black87,
          );
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.white,
          elevation: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: Row(
              children: [
                SizedBox(
                  width: 170,
                  child: Image.network(
                    _vm.heroList[index].imageSmall,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 12, right: 10),
                        child: Text(
                          _vm.heroList[index].name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 10, right: 5),
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
                        padding: const EdgeInsets.only(
                            left: 11.0, bottom: 10, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'More info',
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
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
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
