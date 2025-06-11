// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/secure_storage_helper.dart';
import '../../../../core/databases/params/params.dart';
import '../model/template_t_model.dart';

class TemplateTRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  TemplateTRemoteDataSource({required this.api, required this.cacheHelper});
  Future<TemplateTModel> templateT(TemplateParams params) async {
    final response = await api.get(
      // data: body.toMap(),
      "${EndPoints.templateT}/${params.templateId}/",
    );
    return TemplateTModel.fromMap(response);
  }
}
