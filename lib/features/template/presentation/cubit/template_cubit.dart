import 'package:flutter_bloc/flutter_bloc.dart';

import 'template_state.dart';

class TemplateCubit extends Cubit<TemplateCubitState> {
  TemplateCubit()
    : super(
        const TemplateCubitState(
          templateId: 0,
          templateName: '',
          templateDescription: '',
          status: TemplateCubitStatus.initial,
        ),
      );

  void fetchTemplate(int templateId) {
    emit(state.copyWith(templateId: templateId));
  }
}
