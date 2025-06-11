import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final LoginCubitStatus status;
  final String? errorMessage;

  const LoginState({required this.status, this.errorMessage});

  LoginState copyWith({LoginCubitStatus? status, String? errorMessage}) {
    return LoginState(status: status!, errorMessage: errorMessage);
  }

  @override
  List<Object?> get props => [status, errorMessage];
}

enum LoginCubitStatus { initial, loading, loaded, error }
