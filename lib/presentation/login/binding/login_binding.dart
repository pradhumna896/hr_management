import '../controller/login_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone14ProNinetynineScreen.
///
/// This class ensures that the Iphone14ProNinetynineController is created when the
/// Iphone14ProNinetynineScreen is first loaded.
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
