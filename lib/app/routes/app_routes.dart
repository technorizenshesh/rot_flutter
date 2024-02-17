// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const SIGN_UP = _Paths.SIGN_UP;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
  static const CHECK_YOUR_MAIL = _Paths.CHECK_YOUR_MAIL;
  static const CREATE_NEW_PASSWORD = _Paths.CREATE_NEW_PASSWORD;
  static const RESULT = _Paths.RESULT;
  static const NAV_BAR = _Paths.NAV_BAR;
  static const PROFILE = _Paths.PROFILE;
  static const MY_PROFILE = _Paths.MY_PROFILE;
  static const RATE_US = _Paths.RATE_US;
  static const CHANGE_PASSWORD = _Paths.CHANGE_PASSWORD;
  static const LOGIN_WITH_EMAIL = _Paths.LOGIN_WITH_EMAIL;
  static const SIGN_UP_WITH_EMAIL = _Paths.SIGN_UP_WITH_EMAIL;
  static const OTP = _Paths.OTP;
  static const RESET_PASSWORD_MAIL = _Paths.RESET_PASSWORD_MAIL;
  static const FAVORITES = _Paths.FAVORITES;
  static const CHATS = _Paths.CHATS;
  static const MY_QR_CODE = _Paths.MY_QR_CODE;
  static const HELP = _Paths.HELP;
  static const HELP_CHAT = _Paths.HELP_CHAT;
  static const HELP_CENTER = _Paths.HELP_CENTER;
  static const CATEGORIES = _Paths.CATEGORIES;
  static const UPLOAD = _Paths.UPLOAD;
  static const PRODUCT_DETAIL = _Paths.PRODUCT_DETAIL;
  static const SEARCH = _Paths.SEARCH;
  static const PRODUCTS_STATUS = _Paths.PRODUCTS_STATUS;
  static const HASHTAG = _Paths.HASHTAG;
  static const PROFILE_DETAIL = _Paths.PROFILE_DETAIL;
  static const CHAT_DETAIL = _Paths.CHAT_DETAIL;
  static const PACKAGE_PREPARATION = _Paths.PACKAGE_PREPARATION;
  static const PURCHASES_STATUS = _Paths.PURCHASES_STATUS;
  static const GENERAL_SETTING = _Paths.GENERAL_SETTING;
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const TWO_STEP_VERIFICATION = _Paths.TWO_STEP_VERIFICATION;
  static const APP_UNLOCK = _Paths.APP_UNLOCK;
  static const LINKED_DEVICES = _Paths.LINKED_DEVICES;
  static const COLLABORATOR = _Paths.COLLABORATOR;
  static const SALES = _Paths.SALES;
  static const PURCHASES = _Paths.PURCHASES;
  static const SUBSCRIPTION = _Paths.SUBSCRIPTION;
  static const PROFILE_PUBLIC = _Paths.PROFILE_PUBLIC;
  static const SOMETHING_WENT_WRONG = _Paths.SOMETHING_WENT_WRONG;
  static const COLLABORATORS_READY_TO_SEND = _Paths.COLLABORATORS_READY_TO_SEND;
  static const INVITE_COLLABORATOR = _Paths.INVITE_COLLABORATOR;
  static const INVITE_COLLABORATOR_CHOOSE_A_ROLE =
      _Paths.INVITE_COLLABORATOR_CHOOSE_A_ROLE;
  static const INVITE_COLLABORATOR_CHOOSE_A_ROLE_CONFIRM =
      _Paths.INVITE_COLLABORATOR_CHOOSE_A_ROLE_CONFIRM;
  static const INVITE_COLLABORATOR_CHOOSE_A_ROLE_SEND_INVITATION =
      _Paths.INVITE_COLLABORATOR_CHOOSE_A_ROLE_SEND_INVITATION;
  static const ADD_NEW_ACCOUNT = _Paths.ADD_NEW_ACCOUNT;
  static const BANK_INFORMATION = _Paths.BANK_INFORMATION;
  static const ADD_NEW_BANK = _Paths.ADD_NEW_BANK;
  static const TWO_STEP_VERIFICATION_TWO = _Paths.TWO_STEP_VERIFICATION_TWO;
  static const TWO_STEP_VERIFICATION_OTP = _Paths.TWO_STEP_VERIFICATION_OTP;
  static const WALLET = _Paths.WALLET;
  static const RECHARGE = _Paths.RECHARGE;
  static const RECHARGE_SUMMARY = _Paths.RECHARGE_SUMMARY;
  static const RECHARGE_DONE = _Paths.RECHARGE_DONE;
  static const WITHDRAW = _Paths.WITHDRAW;
  static const CONVERTER = _Paths.CONVERTER;
  static const HISTORY_OF_MOVEMENTS = _Paths.HISTORY_OF_MOVEMENTS;
  static const ACCOUNTS = _Paths.ACCOUNTS;
  static const CHANGE = _Paths.CHANGE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const SIGN_UP = '/sign-up';
  static const RESET_PASSWORD = '/reset-password';
  static const CHECK_YOUR_MAIL = '/check-your-mail';
  static const CREATE_NEW_PASSWORD = '/create-new-password';
  static const RESULT = '/result';
  static const NAV_BAR = '/nav-bar';
  static const PROFILE = '/profile';
  static const MY_PROFILE = '/my-profile';
  static const RATE_US = '/rate-us';
  static const CHANGE_PASSWORD = '/change-password';
  static const LOGIN_WITH_EMAIL = '/login-with-email';
  static const SIGN_UP_WITH_EMAIL = '/sign-up-with-email';
  static const OTP = '/otp';
  static const RESET_PASSWORD_MAIL = '/reset-password-mail';
  static const FAVORITES = '/favorites';
  static const CHATS = '/chats';
  static const MY_QR_CODE = '/my-qr-code';
  static const HELP = '/help';
  static const HELP_CHAT = '/help-chat';
  static const HELP_CENTER = '/help-center';
  static const CATEGORIES = '/categories';
  static const UPLOAD = '/upload';
  static const PRODUCT_DETAIL = '/product-detail';
  static const SEARCH = '/search';
  static const PRODUCTS_STATUS = '/products-status';
  static const HASHTAG = '/hashtag';
  static const PROFILE_DETAIL = '/profile-detail';
  static const CHAT_DETAIL = '/chat-detail';
  static const PACKAGE_PREPARATION = '/package-preparation';
  static const PURCHASES_STATUS = '/purchases-status';
  static const GENERAL_SETTING = '/general-setting';
  static const NOTIFICATION = '/notification';
  static const TWO_STEP_VERIFICATION = '/two-step-verification';
  static const APP_UNLOCK = '/app-unlock';
  static const LINKED_DEVICES = '/linked-devices';
  static const COLLABORATOR = '/collaborator';
  static const SALES = '/sales';
  static const PURCHASES = '/purchases';
  static const SUBSCRIPTION = '/subscription';
  static const PROFILE_PUBLIC = '/profile-public';
  static const SOMETHING_WENT_WRONG = '/something-went-wrong';
  static const COLLABORATORS_READY_TO_SEND = '/collaborators-ready-to-send';
  static const INVITE_COLLABORATOR = '/invite-collaborator';
  static const INVITE_COLLABORATOR_CHOOSE_A_ROLE =
      '/invite-collaborator-choose-a-role';
  static const INVITE_COLLABORATOR_CHOOSE_A_ROLE_CONFIRM =
      '/invite-collaborator-choose-a-role-confirm';
  static const INVITE_COLLABORATOR_CHOOSE_A_ROLE_SEND_INVITATION =
      '/invite-collaborator-choose-a-role-send-invitation';
  static const ADD_NEW_ACCOUNT = '/add-new-account';
  static const BANK_INFORMATION = '/bank-information';
  static const ADD_NEW_BANK = '/add-new-bank';
  static const TWO_STEP_VERIFICATION_TWO = '/two-step-verification-two';
  static const TWO_STEP_VERIFICATION_OTP = '/two-step-verification-otp';
  static const WALLET = '/wallet';
  static const RECHARGE = '/recharge';
  static const RECHARGE_SUMMARY = '/recharge-summary';
  static const RECHARGE_DONE = '/recharge-done';
  static const WITHDRAW = '/withdraw';
  static const CONVERTER = '/converter';
  static const HISTORY_OF_MOVEMENTS = '/history-of-movements';
  static const ACCOUNTS = '/accounts';
  static const CHANGE = '/change';
}
