import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(status: LoginCubitStatus.initial));
  final usernameController = TextEditingController();
  final passwordontroller = TextEditingController();

  Future<void> login(BuildContext context) async {
    emit(state.copyWith(status: LoginCubitStatus.loading, errorMessage: null));
    await Future.delayed(const Duration(seconds: 2));

    if (usernameController.text == "admin" &&
        passwordontroller.text == "1234") {
      emit(state.copyWith(status: LoginCubitStatus.loaded));
    } else {
      emit(
        state.copyWith(
          status: LoginCubitStatus.error,
          errorMessage: "اسم المستخدم أو كلمة السر غير صحيحة",
        ),
      );
    }

    //await Future.delayed(const Duration(seconds: 2));
    //
  }
}
