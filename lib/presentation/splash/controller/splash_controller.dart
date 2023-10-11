
import 'package:get/get.dart';
import 'package:hr_management/routes/app_routes.dart';

class SplashController extends GetxController{

  @override
  void onReady() {
    jumpToHome();
    super.onReady();
  }

  jumpToHome()async{
   await Future.delayed(Duration(seconds: 2),(){
      Get.offNamed(AppRoutes.loginScreen);
    });
  }

}