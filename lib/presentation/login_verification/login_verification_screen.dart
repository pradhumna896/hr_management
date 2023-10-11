import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hr_management/data/apiClient/http_response.dart';
import 'package:hr_management/widgets/custom_loader.dart';

import '../../theme/custom_text_style.dart';
import '../../utils/size_utils.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_pin_code_text_field.dart';
import 'controller/login_verification_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginVerificationScreen extends GetWidget<LoginVerificationController> {
  LoginVerificationScreen({Key? key})
      : super(
          key: key,
        );
  final email = Get.arguments;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Obx(() => controller.rxRequestStatus.value == Status.loading
                ?const CustomLoading()
                : Container()),
            Expanded(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 39.h,
                  top: 64.v,
                  right: 39.h,
                ),
                child: Column(
                  children: [
                    // CustomImageView(
                    //   imagePath: ImageConstant.imgScreenshot122,
                    //   height: 170.v,
                    //   width: 135.h,
                    // ),
                    SizedBox(height: 39.v),
                    Text(
                      "msg_otp_verification".tr,
                      style: CustomTextStyles.titleMedium16,
                    ),
                    SizedBox(height: 81.v),
                    Opacity(
                      opacity: 0.49,
                      child: SizedBox(
                        width: 207.h,
                        child: Text(
                          "msg_enter_the_otp_code".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.labelLargeMulishBlack900SemiBold_1
                              .copyWith(
                            height: 1.83,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => CustomPinCodeTextField(
                        context: context,
                        margin: EdgeInsets.only(
                          left: 18.h,
                          top: 17.v,
                          right: 17.h,
                        ),
                        controller: controller.otpController.value,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(height: 42.v),
                   
                     CustomElevatedButton(
                              text: "lbl_log_in".tr,
                              buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                              onTap: () {
                                controller.loginVerification(email);
                              },
                            ),
                   
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
