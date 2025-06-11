import 'package:dartz/dartz.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/exception.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../../../core/databases/params/params.dart';
import '../../domain/entities/template_t_entity.dart';
import '../../domain/repository/template_t_repository.dart';
import '../data sources/template_t_remote_data_source.dart';

class TemplateTRepositoryImple extends TemplateTRepository {
  final NetworkInfo networkInfo;
  final TemplateTRemoteDataSource remoteDataSource;
  TemplateTRepositoryImple({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, TemplateTEntity>> templateT({required TemplateParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteTempleT = await remoteDataSource.templateT(params);

        return Right(remoteTempleT);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      //TODO make this message adapt to app language:
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}
