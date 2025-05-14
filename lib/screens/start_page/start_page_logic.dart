import 'package:get/get.dart';
import 'package:my_mosque_attedance/screens/home_screen/home_screen.dart';
import 'package:my_mosque_attedance/screens/home_screen/home_screen_logic.dart';
import '../../data/enums/app_state_enum.dart';
import '../../data/enums/loading_state_enum.dart';

class StartPageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(StartPageController());
  }
}

class StartPageController extends GetxController {
  final isConnectedPage = true.obs;
  var loadingState = LoadingState.idle.obs;
  var appState = AppState.run.obs;

  startApp() {
    Get.off(HomeScreen(), binding: HomePageBinging());
  }
}
