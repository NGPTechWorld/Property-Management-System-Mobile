import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/Routes/app_routes.dart';
import '/core/shared/widgets/default_button.dart';
import '/core/utils/constants/app_numbers.dart';
import '/features/login/presentation/cubit/login_cubit.dart';
import '/features/login/presentation/cubit/login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginCubitStatus.loaded) {
          // Navigator.pushNamed(context, AppRoutes.createMosqueScreen);
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: DefaultButton(
                    text: "تسجيل الدخول",
                    onPressed: () {
                      context.read<LoginCubit>().login(context);
                    },
                    disabled: state.status == LoginCubitStatus.loading,
                  ),
                ),
                if (state.status == LoginCubitStatus.loading)
                  const Padding(
                    padding: EdgeInsets.all(AppPadding.p16),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
