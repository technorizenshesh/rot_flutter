import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/get_banner_model.dart';
import '../api_models/get_category_model.dart';
import '../api_models/get_hash_tag_model.dart';
import '../api_models/get_product_details_model.dart';
import '../api_models/get_product_model.dart';
import '../api_models/get_product_status_model.dart';
import '../api_models/get_sub_category_model.dart';
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

  static Future<http.Response?> updateProfile({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    Map<String, File>? imageMap,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfUpdateProfile,
      imageMap: imageMap,
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
}
