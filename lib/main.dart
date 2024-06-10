import 'dart:io';
import 'package:ecommerce_app2/bindings/initialbinding.dart';
import 'package:ecommerce_app2/core/localization/changetranslation.dart';
import 'package:ecommerce_app2/core/localization/translation.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/rotes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  HttpOverrides.global = MyHttpOverrides();

  runApp(
      /*  DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ), */
      const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());

    return GetMaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      initialBinding: InitialBindings(),
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: controller.appTheme,

      /* theme: controller.myServices.sharedPref.getBool("color") == true
          ? ThemeData.dark()
          : ThemeData.light(), */

      //home: const Language(), //const Login(), //const OnBoarding(),
      // routes: routes,
      getPages: routes,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
