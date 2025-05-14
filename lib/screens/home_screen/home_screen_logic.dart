import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_mosque_attedance/app/config/color_manager.dart';
import 'package:my_mosque_attedance/data/entities/attedance_entitie.dart';
import 'package:my_mosque_attedance/data/repositories/users_repositories.dart';
import 'package:my_mosque_attedance/screens/custom_widgets/snack_bar_error.dart';
import 'package:my_mosque_attedance/screens/qr_scanner_screen/qr_scanner_screen.dart';
import '../../data/enums/app_state_enum.dart';
import '../../data/enums/loading_state_enum.dart';
import 'package:http/http.dart' as http;

class HomePageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}

class HomePageController extends GetxController {
  final isConnectedPage = true.obs;
  var loadingState = LoadingState.idle.obs;
  var appState = AppState.run.obs;
  final userRepo = Get.find<ImpUsersRepositories>();

  openQRCode(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => QRScannerScreen(
              onDetect: (id) {
                attedance(id, context);
              },
            ),
      ),
    );
  }

  attedance(String id, BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await userRepo.attedance(id: id);

    if (response.success) {
      SnackBarCustom.show(context, "تم تسجيل الحضور", ColorManager.greenColor);
    } else if (response.networkFailure!.code == 302) {
      SnackBarCustom.show(context, "تم تسجيل الحضور", ColorManager.greenColor);
    } else {
      SnackBarCustom.show(context, "هناك خطأ ما", ColorManager.redColor);
    }
    loadingState.value = LoadingState.idle;
  }
}
