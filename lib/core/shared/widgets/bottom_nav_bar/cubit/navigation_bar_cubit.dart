import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarCubit extends Cubit<int> {
  NavigationBarCubit() : super(0); // 0 Home Page

  void updateIndex(int index) {
    emit(index);
  }
}
