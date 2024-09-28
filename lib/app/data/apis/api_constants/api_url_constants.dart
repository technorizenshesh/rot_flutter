class ApiUrlConstants {
  static const String baseUrl =
      'https://recyclingofthings.com/rot/api/'; //https://server-php-8-2.technorizen.com/rot/api/
  static const String baseUrlForGetMethodParams =
      'recyclingofthings.com'; //server-php-8-2.technorizen.com
  static const String endPointOfUserSignup = '${baseUrl}UserSignup';
  static const String endPointOfUserVerification =
      '${baseUrl}user_verification';
  static const String endPointOfLogin = '${baseUrl}login';
  static const String endPointOfLoginWithGoogle = '${baseUrl}login_with_google';
  static const String endPointOfForgetPassword = '${baseUrl}forget_password';
  static const String endPointOfCreateNewPassword =
      '${baseUrl}create_new_password';
  static const String endPointOfCreateNewPasswordWithMobile =
      '${baseUrl}create_newpassword_with_mobile';
  static const String endPointOfChangePassword = '${baseUrl}change_password';
  static const String endPointOfGetCategory = '${baseUrl}get_category';
  static const String endPointOfGetWishCategory = '${baseUrl}get_wish_category';
  static const String endPointOfGetBrand = '${baseUrl}get_brand';
  static const String endPointOfGetModelByBrand = '/rot/api/get_model';
  static const String endPointOfGetTypeEngines = '${baseUrl}get_type_engines';
  static const String endPointOfGetServiceType = '${baseUrl}get_services';
  static const String endPointOfGetTransmission = '${baseUrl}get_transmission';
  static const String endPointOfGetCurrency = '${baseUrl}get_currency';
  static const String endPointOfGetSubCategory = '/rot/api/get_sub_category';
  static const String endPointOfGetProduct = '/rot/api/get_product';
  static const String endPointOfGetAllProduct = '/rot/api/get_all_product';
  static const String endPointOfGetCategoryProduct =
      '/rot/api/get_category_product';
  static const String endPointOfGetProductDetail =
      '/rot/api/get_product_details';
  static const String endPointOfDeleteProduct = '/rot/api/delete_product';
  static const String endPointOfUpdateProjectStatus =
      '${baseUrl}update_product_status';
  static const String endPointOfProductLikeUnlike =
      '/rot/api/product_like_unlike';
  static const String endPointOfProductSoldReserved = '/rot/api/sold_reserved';
  static const String endPointOfGetFavoriteProduct =
      '/rot/api/get_like_product';
  static const String endPointOfGetProductByUserId =
      '/rot/api/get_product_user_id';
  static const String endPointOfGetMyLikeUser = '/rot/api/get_like_user';
  static const String endPointOfGetUserDetails = '/rot/api/get_user_details';
  static const String endPointOfUserLikeUnlike = '/rot/api/user_like_unlike';
  static const String endPointOfGetProfile = '/rot/api/get_profile';
  static const String endPointOfGetStates = '/rot/api/get_states';
  static const String endPointOfGetCity = '/rot/api/get_city';
  static const String endPointOfGetBanner = '${baseUrl}get_banner';
  static const String endPointOfGetCountry = '${baseUrl}get_country';
  static const String endPointOfGetHashTag = '${baseUrl}get_hash_tag';
  static const String endPointOfGetProductStatus =
      '${baseUrl}get_product_status';
  static const String endPointOfUpdateProfile = '${baseUrl}update_profile';
  static const String endPointOfGetConversation = '${baseUrl}get_conversation';
  static const String endPointOfGetChat = '${baseUrl}get_chat';
  static const String endPointOfInsertChat = '${baseUrl}insert_chat';
  static const String endPointOfSubscriptionPurchase =
      '${baseUrl}subcription_purcharge';
  static const String endPointOfGetMyPurchasedSubscription =
      '/rot/api/get_my_purcharge';
  static const String endPointOfAddProduct = '${baseUrl}add_product';
  static const String endPointOfUpdateProduct = '${baseUrl}update_product';
  static const String endPointOfBuyProductDelivery =
      '/rot/api/product_delivery';
  static const String endPointOfGetProductDelivery =
      '/rot/api/get_product_delivery';
  static const String endPointOfGetProductUser = '/rot/api/get_product_user';
  static const String endPointOfGetNotification = '/rot/api/get_notification';
  static const String endPointOfAddReview = '/rot/api/add_review';
  static const String endPointOfGetReview = '/rot/api/get_review';
  static const String endPointOfAddCard = '/rot/api/add_card';
  static const String endPointOfDeleteCard = '/rot/api/delete_card';
  static const String endPointOfGetCard = '/rot/api/get_card';
  static const String endPointOfGetToken = '/rot/api/get_token';
  static const String endPointOfAddWallet = '/rot/api/add_wallet';
  static const String endPointOfGetWalletHistory =
      '/rot/api/get_wallet_history';
  static const String endPointOfGetPages = '/rot/api/get_pages';
  static const String endPointOfAddHelpChat = '/rot/api/add_contact';
  static const String endPointOfAddWalletsExchangeAmount =
      '/rot/api/add_wallets_exchange_amount';
  static const String endPointOfGetWallet = '/rot/api/get_wallet';
  static const String endPointOfGetWalletByCurrency =
      '/rot/api/get_wallet_by_currency';
  static const String endPointOfGetExistEmailPhone =
      '/rot/api/exist_email_phone';
  static const String endPointOfSendQrCode = '/rot/api/send_qr_code';
  static const String endPointOfCheckQrCode = '/rot/api/get_send_qr_code';
  static const String endPointOfGetShippingCharge =
      '/rot/api/get_shipping_charges';
  static const String endPointOfGetLocalInternationalAccount =
      '/rot/api/get_local_international_account';
  static const String endPointOfDeleteLocalInternationalAccount =
      '/rot/api/delete_local_international_account';
  static const String endPointOfGetSubscription = '${baseUrl}get_subscription';
  static const String endPointOfAddAddress = '${baseUrl}add_address';
  static const String endPointOfGetMyAddress = '/rot/api/get_address';
  static const String endPointOfGetLocation = '/rot/api/getlocation';
  static const String endPointOfGetAllProductCountry =
      '/rot/api/get_all_product_country';
  static const String endPointOfLocalInternationAccount =
      '/rot/api/add_local_international_account';
  static const String endPointOfSendOtpForAccountVerification =
      '${baseUrl}account_verify_otp';
  static const String endPointOfCheckOtpForAccountVerification =
      '${baseUrl}check_otp_for_account_verification';
  static const String endPointOfAddSendFriendRequest =
      '${baseUrl}add_send_friend_request';
  static const String endPointOfFriendRequestAcceptReject =
      '${baseUrl}friend_request_accept_reject';
  static const String endPointOfGetMyFriendList = '/rot/api/my_friend_list';
  static const String endPointOfGetLoginDetails = '/rot/api/login_details';
  static const String endPointOfGetNotificationSetting =
      '/rot/api/get_notification_setting';
  static const String endPointOfGetCollaboratorPermission =
      '/rot/api/get_collaborators_permission';
  static const String endPointOfSaveNotificationSetting =
      '${baseUrl}save_notification_setting';
  static const String endPointOfAddShipmentContactRequest =
      '${baseUrl}add_shipment_contact_request';
  static const String endPointOfAddReportProduct =
      '${baseUrl}add_report_product';
  static const String endPointOfProductExpiryDate =
      '${baseUrl}product_expiry_date';

  static const String endPointOfSendCollaboratorInvite =
      '${baseUrl}send_collaborators_invite';

  static const String endPointOfGetCollaboratorsInvite =
      '/rot/api/get_collaborators_invite';
  static const String endPointOfDeleteCollaboratorsInvite =
      '/rot/api/delete_collaborators_invite';
  static const String endPointOfResendCollaboratorsInvite =
      '/rot/api/resend_collaborators_invite';

  static const String endPointOfAcceptRejectOrder =
      '${baseUrl}accept_reject_order';
}
