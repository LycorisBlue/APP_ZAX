import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hatooh/Welcome/onboarding.dart';
import 'package:hatooh/langues.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

const orange = Color(0xffff9c00);
const gris_clair = Color(0xfff7f7f7);
const gris_pur = Color(0xff808080);
const text_noir = Color(0xff321f00);
const grey_icon = Color(0xffb2b2b2);
const gris_clair2 = Color(0xffe5e5e5);
const blanc = Color(0xFFFFFFFF);
const noir = Color(0xFF000000);
const rouge = Color(0xFFFF0000);
const transparent = Color(0x00000000);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initializeDateFormatting('fr_FR', null);
  await _initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark));

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            translations: Langues(),
            locale: Get.deviceLocale,
            fallbackLocale: Locale('fr', 'FR'),
            debugShowCheckedModeBanner: false,
            home: Onboarding(),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              Locale('fr', 'FR'),
              Locale('en', 'US'),
              Locale('es', 'ES')
            ],
          );
        });
  }
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("accounts");
}
