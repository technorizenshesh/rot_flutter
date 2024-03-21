import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_models/get_card_list_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_chat_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_conversation_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_like_users_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_notification_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_delivery_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_review_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_simple_model.dart';

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/get_all_product_model.dart';
import '../api_models/get_banner_model.dart';
import '../api_models/get_category_model.dart';
import '../api_models/get_city_model.dart';
import '../api_models/get_country_model.dart';
import '../api_models/get_currency_model.dart';
import '../api_models/get_favorite_product_model.dart';
import '../api_models/get_hash_tag_model.dart';
import '../api_models/get_product_details_model.dart';
import '../api_models/get_product_model.dart';
import '../api_models/get_product_status_model.dart';
import '../api_models/get_profile_public_model.dart';
import '../api_models/get_profile_public_products_model.dart';
import '../api_models/get_state_model.dart';
import '../api_models/get_sub_category_model.dart';
import '../api_models/response_model.dart';
import '../api_models/user_model.dart';

class ApiMethods {
  static Future<UserModel?> userSignup({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUserSignup,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> userVerification({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUserVerification,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> login({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogin,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> forgetPassword({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfForgetPassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> createNewPassword({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCreateNewPassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<http.Response?> changePassword({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChangePassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> updateProfile(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> bodyParams,
      required File? imageFile
      //Map<String, File>? imageMap,
      }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfUpdateProfile,
      //imageMap: imageMap,
      image: imageFile,
      imageKey: 'image',
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<GetCategoryModel?> getCategory({
    void Function(int)? checkResponse,
  }) async {
    GetCategoryModel? getCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCategoryModel = GetCategoryModel.fromJson(jsonDecode(response.body));
      return getCategoryModel;
    }
    return null;
  }

  static Future<GetCurrencyModel?> getCurrency({
    void Function(int)? checkResponse,
  }) async {
    GetCurrencyModel? getCurrencyModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetCurrency,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCurrencyModel = GetCurrencyModel.fromJson(jsonDecode(response.body));
      return getCurrencyModel;
    }
    return null;
  }

  static Future<GetSubCategoryModel?> getSubCategory({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetSubCategoryModel? getSubCategoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetSubCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getSubCategoryModel =
          GetSubCategoryModel.fromJson(jsonDecode(response.body));
      return getSubCategoryModel;
    }
    return null;
  }

  static Future<GetProductModel?> getProduct({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetProductModel? getProductModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetProduct,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getProductModel = GetProductModel.fromJson(jsonDecode(response.body));
      return getProductModel;
    }
    return null;
  }

  static Future<GetAllProductModel?> getAllProduct({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetAllProductModel? getAllProductModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetAllProduct,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getAllProductModel =
          GetAllProductModel.fromJson(jsonDecode(response.body));
      return getAllProductModel;
    }
    return null;
  }

  static Future<GetProductDetailsModel?> getProductDetail({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetProductDetailsModel? getProductDetailsModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetProductDetail,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getProductDetailsModel =
          GetProductDetailsModel.fromJson(jsonDecode(response.body));
      return getProductDetailsModel;
    }
    return null;
  }

  static Future<http.Response?> productLikeUnlike({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfProductLikeUnlike,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<UserModel?> getProfile({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetProfile,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<GetStateModel?> getStates({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetStateModel? getStateModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetStates,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getStateModel = GetStateModel.fromJson(jsonDecode(response.body));
      return getStateModel;
    }
    return null;
  }

  static Future<GetCityModel?> getCity({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetCityModel? userModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetCity,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = GetCityModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<GetBannerModel?> getBanner({
    void Function(int)? checkResponse,
  }) async {
    GetBannerModel? getBannerModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetBanner,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getBannerModel = GetBannerModel.fromJson(jsonDecode(response.body));
      return getBannerModel;
    }
    return null;
  }

  static Future<GetCountryModel?> getCountry({
    void Function(int)? checkResponse,
  }) async {
    GetCountryModel? getCountryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetCountry,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCountryModel = GetCountryModel.fromJson(jsonDecode(response.body));
      return getCountryModel;
    }
    return null;
  }

  static Future<GetHashTagModel?> getHashTag({
    void Function(int)? checkResponse,
  }) async {
    GetHashTagModel? getHashTagModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetHashTag,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getHashTagModel = GetHashTagModel.fromJson(jsonDecode(response.body));
      return getHashTagModel;
    }
    return null;
  }

  static Future<GetProductStatusModel?> getProductStatus({
    void Function(int)? checkResponse,
  }) async {
    GetProductStatusModel? getProductStatusModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetProductStatus,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getProductStatusModel =
          GetProductStatusModel.fromJson(jsonDecode(response.body));
      return getProductStatusModel;
    }
    return null;
  }

  static Future<GetFavoriteProductModel?> getFavoriteProduct({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetFavoriteProductModel? getFavoriteProductModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetFavoriteProduct,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getFavoriteProductModel =
          GetFavoriteProductModel.fromJson(jsonDecode(response.body));
      return getFavoriteProductModel;
    }
    return null;
  }

  static Future<GetProfilePublicModel?> getProfilePublic({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetProfilePublicModel? getProfilePublicModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetUserDetails,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getProfilePublicModel =
          GetProfilePublicModel.fromJson(jsonDecode(response.body));
      return getProfilePublicModel;
    }
    return null;
  }

  static Future<http.Response?> userLikeUnlike({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfUserLikeUnlike,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<ProfilePublicProductsModel?> getProductByUserId({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    ProfilePublicProductsModel? profilePublicProductsModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetProductByUserId,
      checkResponse: checkResponse,
    );
    if (response != null) {
      profilePublicProductsModel =
          ProfilePublicProductsModel.fromJson(jsonDecode(response.body));
      return profilePublicProductsModel;
    }
    return null;
  }

  static Future<GetLikeUsersModel?> getMyLikeUserList({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetLikeUsersModel? getLikeUsersModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetMyLikeUser,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getLikeUsersModel = GetLikeUsersModel.fromJson(jsonDecode(response.body));
      return getLikeUsersModel;
    }
    return null;
  }

  static Future<GetConversationModel?> getConversationList({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetConversationModel? getConversationModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetConversation,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getConversationModel =
          GetConversationModel.fromJson(jsonDecode(response.body));
      return getConversationModel;
    }
    return null;
  }

  static Future<GetChatModel?> getChat({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetChatModel? getChatModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetChat,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getChatModel = GetChatModel.fromJson(jsonDecode(response.body));
      return getChatModel;
    }
    return null;
  }

  static Future<http.Response?> insertChat({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    //UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfInsertChat,
      checkResponse: checkResponse,
    );
    if (response != null) {
      //userModel = UserModel.fromJson(jsonDecode(response.body));
      return response;
    }
    return null;
  }

  static Future<http.Response?> buyProduct({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfBuyProductDelivery,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  /// Get product delivery
  static Future<GetProductDeliveryModel?> getProductDelivery({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetProductDeliveryModel? getProductDeliveryModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetProductDelivery,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getProductDeliveryModel =
          GetProductDeliveryModel.fromJson(jsonDecode(response.body));
      return getProductDeliveryModel;
    }
    return null;
  }

  ///Add Product Api ....
  static Future<http.Response?> addProductApi(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      List<File>? imageList}) async {
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddProduct,
      images: imageList,
      imageKey: 'image[]',
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  /// Get product User
  static Future<GetProductDeliveryModel?> getProductUser({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetProductDeliveryModel? getProductDeliveryModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetProductUser,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getProductDeliveryModel =
          GetProductDeliveryModel.fromJson(jsonDecode(response.body));
      return getProductDeliveryModel;
    }
    return null;
  }

  /// Get Notification Api
  static Future<NotificationModel?> getNotification({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    NotificationModel? notificationModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetNotification,
      checkResponse: checkResponse,
    );

    if (response != null) {
      notificationModel = NotificationModel.fromJson(jsonDecode(response.body));
      return notificationModel;
    }
    return null;
  }

  ///Add Review Api....
  static Future<SimpleResponseModel?> addReview({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfAddReview,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  ///Get Review Api....
  static Future<ReviewModel?> getReview({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    ReviewModel? reviewModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetReview,
      checkResponse: checkResponse,
    );
    if (response != null) {
      reviewModel = ReviewModel.fromJson(jsonDecode(response.body));
      return reviewModel;
    }
    return null;
  }

  static Future<ResponseModel?> addNewCard({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    ResponseModel? responseModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfAddCard,
      checkResponse: checkResponse,
    );
    if (response != null) {
      responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      return responseModel;
    }
    return null;
  }

  /// Get All Card List Model .....
  static Future<CardListModel?> getCardListApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    CardListModel? cardListModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetCard,
      checkResponse: checkResponse,
    );
    if (response != null) {
      cardListModel = CardListModel.fromJson(jsonDecode(response.body));
      return cardListModel;
    }
    return null;
  }
}
