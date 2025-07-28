import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/controllers/error_dialog_controller.dart';
import 'package:cement_industries_dealer/app/controllers/loader_controller.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/generated/locales.dart';
import 'package:cement_industries_dealer/utility/connectivity_utils.dart';
import 'package:cement_industries_dealer/utility/shared_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityUtils.instance.init();
  await SharedManager.init();
  runApp(
    GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(LoaderController());
        Get.put(ErrorDialogController());
      }),
      builder: (context, child) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child: child!);
      },
      title: LocaleKeys.app_name,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 0),
        fontFamily: LocaleKeys.hanken,
      ),
    ),
  );
}
