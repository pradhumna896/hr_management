import 'package:get/get.dart';
import 'package:hr_management/presentation/splash/controller/splash_controller.dart';
import 'package:hr_management/utils/image_constant.dart';

import '../../../core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 28.v),
              SizedBox(height: 9.v),
              Text(
                "lbl_get_started".tr,
                style: CustomTextStyles.titleSmallBlue600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
