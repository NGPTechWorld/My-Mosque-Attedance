import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/config/assets_manager.dart';
import '../../app/config/color_manager.dart';
import '../../app/config/values_manager.dart';
import '../../data/enums/loading_state_enum.dart';
import '../../screens/start_page/start_page_logic.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final controller = Get.find<StartPageController>();
  @override
  void initState() {
    super.initState();
    controller.loadingState.value = LoadingState.loading;
    Future.delayed(Duration(seconds: 3), () {
      controller.startApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AssetsManager.appIcon,
              fit: BoxFit.contain,
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p40),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
