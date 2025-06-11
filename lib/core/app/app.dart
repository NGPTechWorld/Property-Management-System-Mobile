import 'package:flutter/material.dart';
import '../Routes/app_router.dart';
import '../Routes/app_routes.dart';
import '../helper/app_functions.dart';
import '../theme/theme.dart';
import '../utils/services/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<AppTheme>().isDark = false;

    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      navigatorObservers: [RouteObserverService()],
      debugShowCheckedModeBanner: false,
      title: '',
      theme: getIt<AppTheme>().light(context),
      darkTheme: getIt<AppTheme>().dark(context),
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRouter().generateRoute,
      //? here you can add the initial route for your app
      initialRoute: AppRoutes.splashScreen,
    );
  }
}
