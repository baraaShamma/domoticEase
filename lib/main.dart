import 'package:domotic_ease/core/localization/change_language_controller.dart';
import 'package:domotic_ease/core/localization/translation.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:domotic_ease/logic/bindings/intial_bindings.dart';
import 'package:domotic_ease/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/constant/them.dart';
import 'core/constant/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangeLanguageController controller = Get.put(ChangeLanguageController());
    return ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 600, name: MOBILE),
        const Breakpoint(start: 601, end: 900, name: TABLET),
        const Breakpoint(start: 901, end: 1023, name: DESKTOP),
        const Breakpoint(start: 1024, end: double.infinity, name: '4K'),
      ],
      child: Builder(builder: (context) {
        return ScreenUtilInit(
            // designSize: kIsWeb ? const Size(1440, 800) : const Size(360, 800),
            designSize:
                ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                    ? const Size(360, 800)
                    : ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
                        ? const Size(900, 800)
                        : const Size(1440, 800),
            minTextAdapt: true,
            splitScreenMode: true,
            child: GetMaterialApp(
              locale: controller.languageDevices,
              translations: MyTranslation(),
              debugShowCheckedModeBanner: false,
              title: 'domotic_ease',
              theme: ThemesApp.light,
              darkTheme: ThemesApp.dark,
              themeMode: ThemeController().themeDataGet,
              initialBinding: InitialBinding(),
              getPages: routes,
            ));
      }),
    );
  }
}
