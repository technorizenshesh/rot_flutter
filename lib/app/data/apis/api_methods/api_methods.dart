import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_models/get_account_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_add_wallet_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_admin_address_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_brand_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_card_list_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_chat_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_conversation_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_engine_type_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_friends_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_help_center_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_like_users_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_model_by_brand_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_my_address_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_my_purchase_subscription_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_notification_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_place_by_zipcode_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_delivery_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_review_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_sells_country_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_services_type_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_shipping_charge_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_simple_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_subscription_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_token_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_transmission_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_wallet_history_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_wallet_list_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_wish_category_model.dart';

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/get_all_product_model.dart';
import '../api_models/get_banner_model.dart';
import '../api_models/get_buy_product_model.dart';
import '../api_models/get_category_model.dart';
import '../api_models/get_check_qrcode_model.dart';
import '../api_models/get_city_model.dart';
import '../api_models/get_country_model.dart';
import '../api_models/get_currency_model.dart';
import '../api_models/get_delete_account_model.dart';
import '../api_models/get_delete_card_model.dart';
import '../api_models/get_delete_product_model.dart';
import '../api_models/get_exist_email_phone_model.dart';
import '../api_models/get_favorite_product_model.dart';
import '../api_models/get_hash_tag_model.dart';
import '../api_models/get_linked_device_model.dart';
import '../api_models/get_product_details_model.dart';
import '../api_models/get_product_model.dart';
import '../api_models/get_product_status_model.dart';
import '../api_models/get_profile_public_model.dart';
import '../api_models/get_profile_public_products_model.dart';
import '../api_models/get_state_model.dart';
import '../api_models/get_sub_category_model.dart';
import '../api_models/get_wallet_by_currency_model.dart';
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

  static Future<UserModel?> loginWithGoogle({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLoginWithGoogle,
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

  static Future<UserModel?> createNewPasswordWithMobile({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCreateNewPasswordWithMobile,
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

  static Future<WishCategoryModel?> getWishCategory({
    void Function(int)? checkResponse,
  }) async {
    WishCategoryModel? wishCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetWishCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      wishCategoryModel = WishCategoryModel.fromJson(jsonDecode(response.body));
      return wishCategoryModel;
    }
    return null;
  }

  /// Get Brand list .....
  static Future<GetBrandModel?> getBrandList({
    void Function(int)? checkResponse,
  }) async {
    GetBrandModel? getBrandModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetBrand,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getBrandModel = GetBrandModel.fromJson(jsonDecode(response.body));
      return getBrandModel;
    }
    return null;
  }

  /// Get Model by Brand id list .....
  static Future<GetModelByBrandModel?> getModelByBrandIdList({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetModelByBrandModel? getModelByBrandModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetModelByBrand,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getModelByBrandModel =
          GetModelByBrandModel.fromJson(jsonDecode(response.body));
      return getModelByBrandModel;
    }
    return null;
  }

  /// Get Engine Type list .....
  static Future<GetEngineTypeModel?> getEngineTypeList({
    void Function(int)? checkResponse,
  }) async {
    GetEngineTypeModel? getEngineTypeModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetTypeEngines,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getEngineTypeModel =
          GetEngineTypeModel.fromJson(jsonDecode(response.body));
      return getEngineTypeModel;
    }
    return null;
  }

  /// Get Services Type list .....
  static Future<GetServicesTypeModel?> getServicesTypeList({
    void Function(int)? checkResponse,
  }) async {
    GetServicesTypeModel? getServicesTypeModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetServiceType,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getServicesTypeModel =
          GetServicesTypeModel.fromJson(jsonDecode(response.body));
      return getServicesTypeModel;
    }
    return null;
  }

  /// Get Transmission List list .....
  static Future<GetTransmissionModel?> getTransmissionList({
    void Function(int)? checkResponse,
  }) async {
    GetTransmissionModel? getTransmissionModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetTransmission,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getTransmissionModel =
          GetTransmissionModel.fromJson(jsonDecode(response.body));
      return getTransmissionModel;
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

  /// Get product base on categoryId
  static Future<GetAllProductModel?> getCategoryProductList({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetAllProductModel? getAllProductModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetCategoryProduct,
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

  /// product change status sold or reserved ......
  static Future<http.Response?> changeProductStatusSoldOrReserved({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfProductSoldReserved,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  ///Delete product api...
  static Future<DeleteProductModel?> deleteProductByProductId({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    DeleteProductModel? deleteProductModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfDeleteProduct,
      checkResponse: checkResponse,
    );
    if (response != null) {
      deleteProductModel =
          DeleteProductModel.fromJson(jsonDecode(response.body));
      return deleteProductModel;
    }
    return null;
  }

  ///Change  product status api...
  static Future<SimpleResponseModel?> changeProductStatusByProductId({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    SimpleResponseModel? deleteProductModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: queryParameters,
      url: ApiUrlConstants.endPointOfUpdateProjectStatus,
      checkResponse: checkResponse,
    );
    if (response != null) {
      deleteProductModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return deleteProductModel;
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

  static Future<BuyProductModel?> buyProduct({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    BuyProductModel buyProductModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfBuyProductDelivery,
      checkResponse: checkResponse,
    );
    if (response != null) {
      buyProductModel = BuyProductModel.fromJson(jsonDecode(response.body));
      return buyProductModel;
    }
    return null;
  }

  /// Purchase subscription api .....
  static Future<http.Response?> purchaseSubscriptionApi({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: queryParameters,
      url: ApiUrlConstants.endPointOfSubscriptionPurchase,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  /// Get My purchased subscription ....
  static Future<MyPurchaseSubscriptionModel?> getMyPurchasedSubscriptionApi({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    MyPurchaseSubscriptionModel? myPurchaseSubscriptionModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetMyPurchasedSubscription,
      checkResponse: checkResponse,
    );

    if (response != null) {
      myPurchaseSubscriptionModel =
          MyPurchaseSubscriptionModel.fromJson(jsonDecode(response.body));
      return myPurchaseSubscriptionModel;
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

  /// Edit Product api .....
  static Future<http.Response?> editProductApi({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: queryParameters,
      url: ApiUrlConstants.endPointOfUpdateProduct,
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

  ///Delete Card .....
  static Future<DeleteCardModel?> deleteCardApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    DeleteCardModel? deleteCardModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfDeleteCard,
      checkResponse: checkResponse,
    );
    if (response != null) {
      deleteCardModel = DeleteCardModel.fromJson(jsonDecode(response.body));
      return deleteCardModel;
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

  /// Get Token for add wallet amount  Model .....
  static Future<TokenModel?> getTokenApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    TokenModel? tokenModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetToken,
      checkResponse: checkResponse,
    );
    if (response != null) {
      tokenModel = TokenModel.fromJson(jsonDecode(response.body));
      return tokenModel;
    }
    return null;
  }

  /// Add to wallet amount Model .....
  static Future<AddWalletModel?> addToWalletAmountApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    AddWalletModel? addWalletModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfAddWallet,
      checkResponse: checkResponse,
    );
    if (response != null) {
      addWalletModel = AddWalletModel.fromJson(jsonDecode(response.body));
      return addWalletModel;
    }
    return null;
  }

  /// Get wallet history Model .....
  static Future<WalletHistoryModel?> getWalletHistoryApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    WalletHistoryModel? walletHistoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetWalletHistory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      walletHistoryModel =
          WalletHistoryModel.fromJson(jsonDecode(response.body));
      return walletHistoryModel;
    }
    return null;
  }

  /// Get ALL MY Wallet List Money Api....
  static Future<GetWalletListModel?> getMyWalletListApi({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetWalletListModel? getWalletListModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetWallet,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getWalletListModel =
          GetWalletListModel.fromJson(jsonDecode(response.body));
      return getWalletListModel;
    }
    return null;
  }

  /// Get MY Wallet Money By Currency Api....
  static Future<GetWalletByCurrencyModel?> getMyWalletByCurrencyApi({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    GetWalletByCurrencyModel? getWalletByCurrencyModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetWalletByCurrency,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getWalletByCurrencyModel =
          GetWalletByCurrencyModel.fromJson(jsonDecode(response.body));
      return getWalletByCurrencyModel;
    }
    return null;
  }

  /// Check Email and phone exist Api....
  static Future<ExistEmailPhoneModel?> checkEmailPhoneExistApi({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    ExistEmailPhoneModel? existEmailPhoneModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetExistEmailPhone,
      checkResponse: checkResponse,
    );
    if (response != null) {
      existEmailPhoneModel =
          ExistEmailPhoneModel.fromJson(jsonDecode(response.body));
      return existEmailPhoneModel;
    }
    return null;
  }

  /// Add Sell Money Api....
  static Future<ResponseModel?> submitSellMoneyApi({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    ResponseModel? responseModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfAddWalletsExchangeAmount,
      checkResponse: checkResponse,
    );
    if (response != null) {
      responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      return responseModel;
    }
    return null;
  }

  /// Get Help Center Model .....
  static Future<HelpCenterModel?> getHelpCenterApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    HelpCenterModel? helpCenterModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetPages,
      checkResponse: checkResponse,
    );
    if (response != null) {
      helpCenterModel = HelpCenterModel.fromJson(jsonDecode(response.body));
      return helpCenterModel;
    }
    return null;
  }

  /// Add Help Chat Message Api....
  static Future<http.Response?> submitHelpChat({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfAddHelpChat,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  /// Get Get Subscription List Model .....
  static Future<GetSubscriptionModel?> getSubscriptionApi(
      {void Function(int)? checkResponse}) async {
    GetSubscriptionModel? subscriptionModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetSubscription,
      checkResponse: checkResponse,
    );
    if (response != null) {
      subscriptionModel =
          GetSubscriptionModel.fromJson(jsonDecode(response.body));
      return subscriptionModel;
    }
    return null;
  }

  /// Add Send QrCode Api....
  static Future<ResponseModel?> sendQrCodeApi({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    ResponseModel? responseModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfSendQrCode,
      checkResponse: checkResponse,
    );
    if (response != null) {
      responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      return responseModel;
    }
    return null;
  }

  /// Check Qr Code  Model .....
  static Future<CheckQrCodeModel?> checkQrCodeApi(
      {required Map<String, dynamic> queryParameters,
      void Function(int)? checkResponse}) async {
    CheckQrCodeModel? checkQrCodeModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfCheckQrCode,
      checkResponse: checkResponse,
    );
    if (response != null) {
      checkQrCodeModel = CheckQrCodeModel.fromJson(jsonDecode(response.body));
      return checkQrCodeModel;
    }
    return null;
  }

  static Future<ResponseModel?> createLocalInternationalAccount({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    ResponseModel? responseModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfLocalInternationAccount,
      checkResponse: checkResponse,
    );
    if (response != null) {
      responseModel = ResponseModel.fromJson(jsonDecode(response.body));
      return responseModel;
    }
    return null;
  }

  /// Check Qr Code  Model .....
  static Future<GetAccountModel?> getAccountApi(
      {required Map<String, dynamic> queryParameters,
      void Function(int)? checkResponse}) async {
    GetAccountModel? getAccountModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetLocalInternationalAccount,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getAccountModel = GetAccountModel.fromJson(jsonDecode(response.body));
      return getAccountModel;
    }
    return null;
  }

  /// Check Qr Code  Model .....
  static Future<DeleteAccountModel?> deleteLocalInternationalAccountApi(
      {required Map<String, dynamic> queryParameters,
      void Function(int)? checkResponse}) async {
    DeleteAccountModel? deleteAccountModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfDeleteLocalInternationalAccount,
      checkResponse: checkResponse,
    );
    if (response != null) {
      deleteAccountModel =
          DeleteAccountModel.fromJson(jsonDecode(response.body));
      return deleteAccountModel;
    }
    return null;
  }

  /// send Otp for Account Verification api  .....
  static Future<SimpleResponseModel?> sendOtpForAccountVerificationApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSendOtpForAccountVerification,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Check Otp for Account Verification api  .....
  static Future<UserModel?> checkOtpForAccountVerificationApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCheckOtpForAccountVerification,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  /// Get sHIPPING CHARGE Model .....
  static Future<GetShippingChargeModel?> getShippingChargeApi(
      {required Map<String, dynamic> queryParameters,
      void Function(int)? checkResponse}) async {
    GetShippingChargeModel? getShippingChargeModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetShippingCharge,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getShippingChargeModel =
          GetShippingChargeModel.fromJson(jsonDecode(response.body));
      return getShippingChargeModel;
    }
    return null;
  }

  /// Get Place by using zipcode List Model .....
  static Future<GetPlacesByZipcodeModel?> getPlaceByZipCodeApi(
      {void Function(int)? checkResponse,
      required String countryCode,
      String? zipcode}) async {
    GetPlacesByZipcodeModel? getPlacesByZipcodeModel;
    http.Response? response = await MyHttp.getMethod(
      url: 'https://api.zippopotam.us/$countryCode/$zipcode',
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPlacesByZipcodeModel =
          GetPlacesByZipcodeModel.fromJson(jsonDecode(response.body));
      return getPlacesByZipcodeModel;
    }
    return null;
  }

  /// Get Place by using zipcode and country code Model .....
  static Future<AdminAddressModel?> getPlaceByCountryCodeAndZipCode({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    AdminAddressModel? adminAddressModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetLocation,
      checkResponse: checkResponse,
    );
    if (response != null) {
      adminAddressModel = AdminAddressModel.fromJson(jsonDecode(response.body));
      return adminAddressModel;
    }
    return null;
  }

  /// Add My Address  Model .....
  static Future<SimpleResponseModel?> addAddressApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddAddress,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Get My Address  Model .....
  static Future<MyAddressModel?> getAddressApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    MyAddressModel? myAddressModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetMyAddress,
      checkResponse: checkResponse,
    );
    if (response != null) {
      myAddressModel = MyAddressModel.fromJson(jsonDecode(response.body));
      return myAddressModel;
    }
    return null;
  }

  /// Get My Product Sell Country  Model .....
  static Future<SellsCountryModel?> getMyProductSellCountryApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    SellsCountryModel? sellsCountryModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetAllProductCountry,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sellsCountryModel = SellsCountryModel.fromJson(jsonDecode(response.body));
      return sellsCountryModel;
    }
    return null;
  }

  /// Add Friend Request api  .....
  static Future<SimpleResponseModel?> addFriendRequestApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddSendFriendRequest,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Get FriendList  Model .....
  static Future<GetFriendsModel?> getFriendsApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetFriendsModel? getFriendsModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetMyFriendList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getFriendsModel = GetFriendsModel.fromJson(jsonDecode(response.body));
      return getFriendsModel;
    }
    return null;
  }

  /// Accept Reject  Friend Request api  .....
  static Future<SimpleResponseModel?> acceptRejectFriendRequestApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfFriendRequestAcceptReject,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel =
          SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Send Shipment request
  static Future<http.Response?> sendShipmentContactRequest({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddShipmentContactRequest,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  /// Add Report Product request...
  static Future<http.Response?> addReportProduct({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddReportProduct,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  /// Get LinkedDevice List  Model .....
  static Future<LinkedDeviceModel?> getLinkedDeviceApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    LinkedDeviceModel? linkedDeviceModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetLoginDetails,
      checkResponse: checkResponse,
    );
    if (response != null) {
      linkedDeviceModel = LinkedDeviceModel.fromJson(jsonDecode(response.body));
      return linkedDeviceModel;
    }
    return null;
  }
}
