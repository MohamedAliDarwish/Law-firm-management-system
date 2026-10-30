import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lawfirm_management_system/features/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'EN'), Locale('ar', 'AR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'AR'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'app_name'.tr(),
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
