abstract class Params {}

class NoParams extends Params {}


class TemplateParams extends Params {
  final int templateId;

  TemplateParams({required this.templateId});
}


//! here you can add more params classes for your requests
