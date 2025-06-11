import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../databases/api/api_consumer.dart';
import '../../databases/api/dio_consumer.dart';
import '../../databases/cache/secure_storage_helper.dart';
import '../../databases/cache/shared_prefs_helper.dart';
import '../../databases/connection/network_info.dart';
import '../../theme/theme.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setupServicesLocator() {
  //!service:

  //! Core:
  getIt.registerLazySingleton<SharedPrefsHelper>(() {
    return SharedPrefsHelper()..init();
  });
  getIt.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoConnectivity(getIt()));
  getIt.registerLazySingleton<AppTheme>(() => AppTheme());

  //! Data Sources:
  // getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(api: getIt()));
  //? inject the data sources here like the above example

  //! local date soures:
  // getIt.registerLazySingleton<SubjectLocalDataSource>(() => SubjectLocalDataSource());
  //? inject the local data sources here like the above example

  //! Repository:
  // getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(networkInfo: getIt(), remoteDataSource: getIt(), localDataSource: getIt()));
  //? inject the repository here like the above example

  //! use cases:
  // getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(repository: getIt()));
  // getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: getIt()));
  //? inject the use cases here like the above example

  //! Interceptors:
  // getIt.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(retrieveAccessTokenUseCase: getIt()));
  //? inject the interceptors here like the above example
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  //! here you can add more init functions for your app
}
