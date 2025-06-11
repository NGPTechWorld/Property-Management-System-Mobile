import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_ms/features/login/presentation/cubit/login_cubit.dart';
import 'package:property_ms/features/login/presentation/login_screen.dart';

import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/template/presentation/cubit/template_cubit.dart';
import '../../features/template/presentation/template_screen.dart';
import '../helper/cubit_helper.dart';
import 'app_routes.dart';

class AppRouter with CubitProviderMixin {
  //? ||================ choose route ==================||
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //!template screen:
      case AppRoutes.template:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => BlocProvider(
                create: (context) => TemplateCubit(),
                child: const TemplateScreen(),
              ),
        );

      //!splash screen:
      //! this for @MohamadAliAlnuaimi
      //todo: please provide the auth cubit here:
      case AppRoutes.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );

      //? here you can add more routes
      case AppRoutes.login:
        //final arg = settings.arguments ;
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => BlocProvider(
                create: (context) => getCubit(() => LoginCubit()),
                child: const LoginScreen(),
              ),
        );

      //!default route:
      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text("No route defined for ${settings.name}"),
                ),
              ),
        );
    }
  }
}
