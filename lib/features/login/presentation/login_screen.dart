import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/constants/app_numbers.dart';
import '/features/login/presentation/widgets/login_button.dart';
import '/features/login/presentation/widgets/login_form.dart';
import '/features/login/presentation/widgets/logo_app.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return const Scaffold(
          body: SingleChildScrollView(
            child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [LogoApp(), LoginForm(), LoginButton()],
              ),
            ),
          ),
        );
      },
    );
  }
}
