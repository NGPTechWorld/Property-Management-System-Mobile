//? this file will be used in the future for tokens handling


// import 'dart:async';
// import 'dart:developer';

// import 'package:dio/dio.dart';

// class AuthInterceptor extends Interceptor {
//   final GetTokenUseCase retrieveAccessTokenUseCase;
//   final AuthEventBus authEventBus = AuthEventBus();

//   AuthInterceptor({required this.retrieveAccessTokenUseCase});

//   @override
//   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     // Check if request should be excluded from authentication
//     if (options.extra.containsKey('no_auth') && options.extra['no_auth'] == true) {
//       // Skip authentication for this request
//       return handler.next(options);
//     }

//     // Get access token from repository
//     final tokenResult = await retrieveAccessTokenUseCase.call();
//     if (tokenResult != null) {
//       options.headers['Authorization'] = tokenResult;
//       log("tokenResult: $tokenResult");
//     }
//     handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     if (err.response?.statusCode == 401) {
//       authEventBus.emit(AuthEvent.accessTokenExpired);
//     }
//     handler.next(err);
//   }
// }

// // First, create the same simple event bus
// class AuthEventBus {
//   static final AuthEventBus _instance = AuthEventBus._internal();

//   factory AuthEventBus() {
//     return _instance;
//   }

//   AuthEventBus._internal();

//   final _controller = StreamController<AuthEvent>.broadcast();

//   Stream<AuthEvent> get stream => _controller.stream;

//   void emit(AuthEvent event) {
//     _controller.add(event);
//   }

//   void dispose() {
//     _controller.close();
//   }
// }

// // Define your auth events
// enum AuthEvent { accessTokenExpired }
