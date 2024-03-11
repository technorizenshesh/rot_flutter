class ApiUrlConstants {
  static const String baseUrl =
      'https://server-php-8-2.technorizen.com/rot/api/';
  static const String baseUrlForGetMethodParams =
      'server-php-8-2.technorizen.com';
  static const String endPointOfUserSignup = '${baseUrl}UserSignup';
  static const String endPointOfUserVerification =
      '${baseUrl}user_verification';
  static const String endPointOfLogin = '${baseUrl}login';
  static const String endPointOfForgetPassword = '${baseUrl}forget_password';
  static const String endPointOfCreateNewPassword =
      '${baseUrl}create_new_password';
  static const String endPointOfGetCategory = '${baseUrl}get_category';
  static const String endPointOfGetCurrency = '${baseUrl}get_currency';
  static const String endPointOfGetSubCategory = '/rot/api/get_sub_category';
  static const String endPointOfGetProduct = '/rot/api/get_product';
  static const String endPointOfGetAllProduct = '/rot/api/get_all_product';
  static const String endPointOfGetProductDetail =
      '/rot/api/get_product_details';
  static const String endPointOfProductLikeUnlike =
      '/rot/api/product_like_unlike';
  static const String endPointOfGetProfile = '/rot/api/get_profile';
  static const String endPointOfGetStates = '/rot/api/get_states';
  static const String endPointOfGetCity = '/rot/api/get_city';
  static const String endPointOfGetBanner = '${baseUrl}get_banner';
  static const String endPointOfGetCountry = '${baseUrl}get_country';
  static const String endPointOfGetHashTag = '${baseUrl}get_hash_tag';
  static const String endPointOfGetProductStatus =
      '${baseUrl}get_product_status';
  static const String endPointOfUpdateProfile = '${baseUrl}update_profile';
}
