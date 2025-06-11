import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/template_cubit.dart';
import 'cubit/template_state.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemplateCubit, TemplateCubitState>(
      builder: (context, state) {
        return Scaffold(body: Center(child: Text(state.templateId.toString())));
      },
    );
  }
}

// BlocSelector<TemplateCubit, TemplateCubitState , TemplateCubitStatus>(
//       selector: (state)=> state.status,
//       builder: (context, state) {
//         return Scaffold(body: Center(child: Text(state.toString())));
//       },
//     );
