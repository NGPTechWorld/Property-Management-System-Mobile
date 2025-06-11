import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_ms/core/utils/constants/app_colors.dart';
import '/core/utils/constants/app_numbers.dart';
import '/features/login/presentation/cubit/login_cubit.dart';
import '/features/login/presentation/cubit/login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<LoginCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Center(
          child: Text(
            "اهلا وسهلا بك",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.primary5Color,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
          child: Text(
            "البريد الإلكتروني",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        TextField(controller: myCubit.usernameController),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
          child: Text(
            "كلمة السر",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        TextField(controller: myCubit.passwordontroller),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return state.errorMessage != null
                ? Text(
                  state.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
