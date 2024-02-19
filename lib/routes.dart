import 'package:domotic_ease/core/constant/app_route.dart';
import 'package:domotic_ease/core/middleware/app_middleware.dart';
import 'package:domotic_ease/view/screen/auth/forget_password/forget_password_screen.dart';
import 'package:domotic_ease/view/screen/auth/forget_password/success_reset_password_screen.dart';
import 'package:domotic_ease/view/screen/auth/forget_password/verify_code_screen.dart';
import 'package:domotic_ease/view/screen/auth/login.dart';
import 'package:domotic_ease/view/screen/auth/forget_password/reset_password_screen.dart';
import 'package:domotic_ease/view/screen/home_screen.dart';
import 'package:domotic_ease/view/screen/main_screen.dart';
import 'package:domotic_ease/view/screen/start/on_boarding.dart';
import 'package:domotic_ease/view/screen/personal/secondary_users_screen.dart';
import 'package:domotic_ease/view/screen/setting/wifi_screen.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const OnBoarding(),
      middlewares: [AppMiddleWare()]),
  // GetPage(
  //     name: "/",
  //     page: () => const TestView(),
  // ),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.loginScreen, page: () => const LoginScreen()),
  GetPage(
      name: AppRoute.forgetPassword, page: () => const ForgetPasswordScreen()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCodeScreen()),
  GetPage(
      name: AppRoute.resetPassword, page: () => const ResetPasswordScreen()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPasswordScreen()),

  GetPage(name: AppRoute.mainScreen, page: () => const MainScreen()),

  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.wifiScreen, page: () => const WifiScreen()),
  GetPage(
      name: AppRoute.secondaryUsers, page: () => const SecondaryUsersScreen()),
];
