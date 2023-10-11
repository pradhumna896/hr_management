import 'package:get/get.dart';
import 'package:hr_management/presentation/home/binding/home_binding.dart';
import 'package:hr_management/presentation/home/ui/home_screen.dart';
import 'package:hr_management/presentation/login/binding/login_binding.dart';
import 'package:hr_management/presentation/login/login_screen.dart';
import 'package:hr_management/presentation/login_verification/binding/login_verification_binding.dart';
import 'package:hr_management/presentation/login_verification/login_verification_screen.dart';
import 'package:hr_management/presentation/splash/binding/splash_binding.dart';
import 'package:hr_management/presentation/splash/ui/splash_screen.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String homeScreen = '/homeScreen';
  static const String loginScreen = '/loginScreen';
  static const String loginVerificationScreen = '/loginVerificationScreen';

  static List<GetPage> pages = [
    GetPage(
      binding: SplashBinding(),
      name: initialRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
      binding: LoginBinding(),
      name: loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      binding: HomeBinding(),
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      binding: LoginVerificationBinding(),
      name: loginVerificationScreen,
      page: () => LoginVerificationScreen(),
    ),
  ];
}
