import 'package:app_marvel/feature/home/domain/entities/hero_entity.dart';
import 'package:app_marvel/feature/home/presenter/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class DetalhesHeroPage extends StatefulWidget {
  const DetalhesHeroPage({Key? key, required this.id}) : super(key: key);

  final int id;

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
            color: Colors.black,
          ),
        ),
        body: Observer(
          builder: (_) {
            return SingleChildScrollView(
              child: _vm.heroEntity == null || _vm.heroEntity!.id != widget.id
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
                      ],
                    ),
            );
          },
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
      padding: const EdgeInsets.only(left: 10.0, top: 5),
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
