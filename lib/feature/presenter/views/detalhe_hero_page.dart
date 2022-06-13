import 'package:app_marvel/feature/domain/entities/value_object/quadrinhos.dart';
import 'package:app_marvel/feature/presenter/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class DetalhesHeroPage extends StatefulWidget {
  const DetalhesHeroPage({Key? key, required this.id, required this.size})
      : super(key: key);

  final int id;
  final Size size;

  @override
  State<DetalhesHeroPage> createState() => _DetalhesHeroPageState();
}

class _DetalhesHeroPageState extends State<DetalhesHeroPage> {
  final HomeViewModel _vm = GetIt.I<HomeViewModel>();
  @override
  void initState() {
    super.initState();
    _vm.getHeroesWithID(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.90,
      child: Observer(
        builder: (_) {
          return Stack(
            children: [
              SizedBox(
                height: widget.size.height * 0.90,
                width: widget.size.width,
                child: SingleChildScrollView(
                  controller: _vm.scrollControllerComics,
                  child:
                      _vm.heroEntity == null || _vm.heroEntity!.id != widget.id
                          ? Column(
                              children: const [
                                CustomSizedBoxImageLoading(),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSizedBoxImage(vm: _vm),
                                CustomTextName(vm: _vm),
                                CustomTextRealName(vm: _vm),
                                CustomTextDescription(vm: _vm),
                                Observer(builder: (_) {
                                  return _vm.isLoadingComics
                                      ? Center(
                                          child: Wrap(
                                            direction: Axis.horizontal,
                                            alignment: WrapAlignment.start,
                                            spacing: 10.0,
                                            runSpacing: 20.0,
                                            children: [
                                              ..._vm.heroEntity!.quadrinhos
                                                  .map((quadrinho) {
                                                return const CustomComicCardLoading();
                                              })
                                            ],
                                          ),
                                        )
                                      : Center(
                                          child: Wrap(
                                            runAlignment: WrapAlignment.center,
                                            direction: Axis.horizontal,
                                            alignment: WrapAlignment.center,
                                            spacing: 10.0,
                                            runSpacing: 15.0,
                                            children: [
                                              ..._vm.heroEntity!.quadrinhos
                                                  .map((quadrinho) {
                                                return CustomComicCard(
                                                  quadrinho: quadrinho,
                                                );
                                              })
                                            ],
                                          ),
                                        );
                                }),
                              ],
                            ),
                ),
              ),
              _vm.isLoading
                  ? Container(
                      height: widget.size.height * 0.90,
                      width: widget.size.width,
                      color: Colors.black54,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}

class CustomComicCardLoading extends StatelessWidget {
  const CustomComicCardLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[500]!,
      child: const SizedBox(
        height: 150,
        width: 100,
        child: Card(),
      ),
    );
  }
}

class CustomComicCard extends StatelessWidget {
  const CustomComicCard({
    Key? key,
    required this.quadrinho,
  }) : super(key: key);

  final Quadrinhos quadrinho;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: 100,
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 100,
              child: Image.network(quadrinho.thumbnail!),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                quadrinho.name!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextDescription extends StatelessWidget {
  const CustomTextDescription({
    Key? key,
    required HomeViewModel vm,
  })  : _vm = vm,
        super(key: key);

  final HomeViewModel _vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: Text(
        _vm.heroEntity!.description ?? '',
        style: const TextStyle(
            color: Colors.black45, fontWeight: FontWeight.normal, fontSize: 14),
      ),
    );
  }
}

class CustomTextRealName extends StatelessWidget {
  const CustomTextRealName({
    Key? key,
    required HomeViewModel vm,
  })  : _vm = vm,
        super(key: key);

  final HomeViewModel _vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 5),
      child: Text(
        _vm.heroEntity!.realName ?? '',
        style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic,
            fontSize: 16),
      ),
    );
  }
}

class CustomTextName extends StatelessWidget {
  const CustomTextName({
    Key? key,
    required HomeViewModel vm,
  })  : _vm = vm,
        super(key: key);

  final HomeViewModel _vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 15),
      child: Text(
        _vm.heroEntity!.name,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }
}

class CustomSizedBoxImage extends StatelessWidget {
  const CustomSizedBoxImage({
    Key? key,
    required HomeViewModel vm,
  })  : _vm = vm,
        super(key: key);

  final HomeViewModel _vm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Image.network(
        _vm.heroEntity!.imageBig,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CustomSizedBoxImageLoading extends StatelessWidget {
  const CustomSizedBoxImageLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[500]!,
      child: const SizedBox(
        height: 300,
        width: double.infinity,
        child: Card(),
      ),
    );
  }
}
