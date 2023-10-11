import 'package:get/get.dart';
import 'package:hr_management/data/apiClient/api_client.dart';
import 'package:hr_management/routes/app_routes.dart';
import '../../../core/app_export.dart';
import '../../../core/constants/api_network.dart';
import '../../../data/apiClient/http_response.dart';

/// A controller class for the Iphone14ProNinetynineScreen.
///
/// This class manages the state of the Iphone14ProNinetynineScreen, including the
/// current iphone14ProNinetynineModelObj
class LoginController extends GetxController {
  ApiClient api = ApiClient();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<bool> agreementText = false.obs;
  final rxRequestStatus = Status.success.obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  login() async {
    var payload = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
      'logout_all': 'true'
    };
    rxRequestStatus.value = Status.loading;
    try {
      var value = await api.post(ApiNetwork.login, payload,);
      if (value.body['success'] == true) {
        print(value.body["success"]);
        Get.toNamed(AppRoutes.loginVerificationScreen,arguments:emailController.value.text);
        rxRequestStatus.value = Status.success;
      } else {
        rxRequestStatus.value = Status.error;
      }
    } catch (e) {
      rxRequestStatus.value = Status.error;
      
    }
  }
}
