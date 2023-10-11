import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hr_management/data/apiClient/http_response.dart';
import 'package:hr_management/theme/custom_text_style.dart';
import 'package:hr_management/utils/image_constant.dart';
import 'package:hr_management/widgets/custom_loader.dart';
import '../../utils/size_utils.dart';
import '../../utils/validation_functions.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/login_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Obx(() =>controller.rxRequestStatus.value == Status.loading? CustomLoading():Container(),),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 39.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      CustomImageView(
                        imagePath: ImageConstant.hrPicture,
                        height: 200.v,
                        width: 160.h,
                      ),
                      SizedBox(height: 41.v),
                      Text(
                        "lbl_log_in".tr,
                        style: CustomTextStyles.titleMedium16,
                      ),
                      SizedBox(height: 53.v),
                      CustomTextFormField(
                        controller: controller.emailController,
                        hintText: "lbl_email".tr,
                        hintStyle: CustomTextStyles.titleSmallSemiBold_1,
                        validator: (value) {
                          if (!isText(value)) {
                            return "Please enter valid text";
                          }
                          return null;
                        },
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 30.h,
                          vertical: 18.v,
                        ),
                        borderDecoration: TextFormFieldStyleHelper.outlinePrimary,
                      ),
                      SizedBox(height: 20.v),
                      CustomTextFormField(
                        controller: controller.passwordController,
                        hintText: "lbl_password".tr,
                        hintStyle: CustomTextStyles.titleSmallSemiBold_1,
                        validator: (value) {
                          if (!isText(value)) {
                            return "Please enter valid text";
                          }
                          return null;
                        },
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 30.h,
                          vertical: 18.v,
                        ),
                        borderDecoration: TextFormFieldStyleHelper.outlinePrimary,
                      ),
                      SizedBox(height: 20.v),
                      Obx(() {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: CustomCheckboxButton(
                            alignment: Alignment.centerLeft,
                            text: "log_out_all".tr,
                            value: controller.agreementText.value,
                            margin: EdgeInsets.only(
                              left: 4.h,
                              top: 17.v,
                              right: 20.h,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            onChange: (value) {
                              controller.agreementText.value = value;
                            },
                          ),
                        );
                      }),
                      SizedBox(height: 48.v),
                      CustomElevatedButton(
                        text: "lbl_log_in".tr,
                        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                        onTap: () {
                          controller.login();
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
      ),
    );
  }
}
