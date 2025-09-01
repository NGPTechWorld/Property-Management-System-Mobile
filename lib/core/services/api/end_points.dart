class EndPoints {
  // static const String baseUrl = "http://192.168.1.3:3000/";
  static const String baseUrl = "https://a0cda5034d19.ngrok-free.app";
  static const String templateT = "/templateT";
  //Map
  static const String mapExplore = "/map/explore";

  //User
  static const String userReservation = "/user-reservation/own";
  static const String userInvoice = "/user-invoice/own/properties/";
  static const String payInvoice = "/user-invoice/";
  static const String userMyPurchases = "/user/myPurchases";
  static const String notifications = "/notifications";
  static const String getNotifications = "/notifications/mobile";
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
  static const String getOfficeList = "/office/list";
  static const String getOfficeSearch = "/office/search";
  static const String postOfficeRate = "/office/rate";
  static const String postOfficeReport = "/office/report";
  static const String getOffice = "/office/";
  static const String getOfficeProperty = "/properties";
  static const String getAdsOffice = "/ads";
  static const String getResidentialOffice = "/residential-office/purchases";
  static const String getRentalOffice = "/rental-contracts/Rent";
  static const String getCommissionOffice = "/office/commission/";

  //Service
  static const String getService = "/service-provider/";
  static const String getTopRateService = "/service-provider/top-rated";
  static const String getServicefFilters = "/service-provider/filters";
  static const String getServiceSearch = "/service-provider/search";
  static const String feedback = "/feedback";
  //! here you can add more end points for your requests

  //Favorites
  static const String getFavorites = "/property-favorite";
  static const String addFavorites = "/property-favorite/";
  static const String add = "/add";
  static const String remove = "/remove";

  //Tourism
  static const String getFiltersTourism = "/tourism/mobile";
  static const String getTourism = "/tourism/mobile/";
  static const String getTourismOnly = "/tourism/";
  static const String availability = "/availability";
  static const String getTourismBook = "/tourism/book";
  static const String getSearchTourism = "/tourism/mobile/search";

  //Profile
  static const String userProfileInfo = "/user/profile";
  static const String getSupports = "/admin/supports/Pfaqs";

  //Posts
  static const String userPost = "/user-post/own";
  static const String userPostOnly = "/user-post/";
  static const String userPostFilters = "/user-post/own/filters";
  static const String deletePost = "/user-post/own/";
  static const String suggestions = "/suggestions";

  //Pay
  static const String paymentsCreate = "/payments/create-payment-intent";
}

class ApiKey {
  static const String message = "message";
  static const String statusCode = "status_code";
  static const String data = "data";
  //! don't add  key here add them to the models classes
  //! here we put key that we use them in all of our requests only
}
