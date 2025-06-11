import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../entities/template_t_entity.dart';
import '../repository/template_t_repository.dart';

class TemplateT {
  final TemplateTRepository repository;

  TemplateT({required this.repository});

  Future<Either<Failure, TemplateTEntity>> call({
    required TemplateParams params,
  }) {
    return repository.templateT(params: params);
  }
}
