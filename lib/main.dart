import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_mosque_attedance/app/config/color_manager.dart';
import '../app/app.dart';
import '../core/binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await AppBinding().initializes();
  AppBinding().dependencies();

  runApp(const App());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: ColorManager.firstColor),
  );
}
