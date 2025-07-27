class EndPoints {
  static const String baseUrl = "http://192.168.1.2:3000";
  static const String templateT = "/templateT";

  //Auth
  static const String signup = "/mobile-auth/signup";
  static const String confirm = "/mobile-auth/confirm";
  static const String login = "/mobile-auth/login";
  static const String refresh = "/mobile-auth/refresh";
  static const String resendOtp = "/mobile-auth/resend-otp";
  static const String resetPassword = "/mobile-auth/reset-password";

  //Property
  static const String getProperty = "/properties/";
  static const String getTopRateProperty = "/properties/top-rated";
  static const String getFiltersProperty = "/properties/filters";
  static const String getSearchProperty = "/properties/search";
  static const String getSearchFilterProperty = "/properties/search/filters";
  static const String getPropertyCompare = "/properties/compare";
  static const String getPropertyPromoted = "/properties/promoted";
  static const String rate = "/rate";
  static const String related = "/related";

  //Office
  static const String getTopRateOffice = "/office/top-rated";

  //Service
  static const String getService = "/service-provider/";
  static const String getTopRateService = "/service-provider/top-rated";
  static const String getServicefFilters = "/service-provider/filters";
  static const String getServiceSearch = "/service-provider/search";
  static const String feedback = "/feedback";
  //! here you can add more end points for your requests
}

class ApiKey {
  static const String message = "message";
  static const String statusCode = "status_code";
  static const String data = "data";
  //! don't add  key here add them to the models classes
  //! here we put key that we use them in all of our requests only
}
