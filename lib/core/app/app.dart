import 'package:flutter/material.dart';
import '../Routes/app_router.dart';
import '../Routes/app_routes.dart';
import '../helper/app_functions.dart';
import '../theme/theme.dart';
import '../utils/services/service_locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<AppTheme>().isDark = false;

    return MaterialApp(
      navigatorObservers: [RouteObserverService()],
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar', ''), Locale('en', '')],
      locale: const Locale('ar', ''),
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
