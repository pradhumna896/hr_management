import 'package:get/get.dart';
import 'package:hr_management/core/constants/api_network.dart';
import 'package:hr_management/data/apiClient/http_response.dart';
import 'package:hr_management/routes/app_routes.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';

/// A controller class for the Iphone14Pro101Screen.
///
/// This class manages the state of the Iphone14Pro101Screen, including the
/// current iphone14Pro101ModelObj
class LoginVerificationController extends GetxController {
  ApiClient api = ApiClient();
  Rx<TextEditingController> otpController = TextEditingController().obs;
  final rxRequestStatus = Status.success.obs;

  loginVerification(email) async {
    var payload = {
      "otp": otpController.value.text.toString(),
      "email": email,
    };

    // return;
    rxRequestStatus.value = Status.loading;
    try {
      var value = await api.post(
        ApiNetwork.loginVerify,
        payload,
      );
      if (value.body['success'] == true) {
        // var jsonData = json.encode(value['payload']);
        rxRequestStatus.value = Status.success;
        // isOtp.value = true;
        // await SessionManager.setToken(value['payload']['token']['token']);
        // await SessionManager.setUser(jsonData);
        // await SessionManager.setUserId(value["payload"]["id"].toString());
        // await SessionManager.setRole(value["payload"]["role"]["name"]);
        Get.offAllNamed(AppRoutes.homeScreen);
        // customFlutterToast(msg: value['message']);
      } else if (value.body['message'] == 'Invalid OTP or OTP expired') {
        rxRequestStatus.value = Status.error;
      }
    } catch (e) {
      rxRequestStatus.value = Status.error;
    }
  }
}
