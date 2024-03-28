import 'package:get/get.dart';
import 'package:rot_application/app/modules/add_new_card/bindings/AddNewCardBinding.dart';
import 'package:rot_application/app/modules/add_new_card/views/AddNewCardView.dart';
import 'package:rot_application/app/modules/my_add_product_detail/bindings/my_add_product_binding.dart';
import 'package:rot_application/app/modules/my_add_product_detail/views/my_add_product_detail_view.dart';

import '../modules/accounts/bindings/accounts_binding.dart';
import '../modules/accounts/views/accounts_view.dart';
import '../modules/add_delivery_address/bindings/add_delivery_address_binding.dart';
import '../modules/add_delivery_address/views/add_delivery_address_view.dart';
import '../modules/add_new_account/bindings/add_new_account_binding.dart';
import '../modules/add_new_account/views/add_new_account_view.dart';
import '../modules/add_new_bank/bindings/add_new_bank_binding.dart';
import '../modules/add_new_bank/views/add_new_bank_view.dart';
import '../modules/app_unlock/bindings/app_unlock_binding.dart';
import '../modules/app_unlock/views/app_unlock_view.dart';
import '../modules/bank_information/bindings/bank_information_binding.dart';
import '../modules/bank_information/views/bank_information_view.dart';
import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/change/bindings/change_binding.dart';
import '../modules/change/views/change_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/chat_detail/bindings/chat_detail_binding.dart';
import '../modules/chat_detail/views/chat_detail_view.dart';
import '../modules/chats/bindings/chats_binding.dart';
import '../modules/chats/views/chats_view.dart';
import '../modules/check_your_mail/bindings/check_your_mail_binding.dart';
import '../modules/check_your_mail/views/check_your_mail_view.dart';
import '../modules/collaborator/bindings/collaborator_binding.dart';
import '../modules/collaborator/views/collaborator_view.dart';
import '../modules/collaborators_ready_to_send/bindings/collaborators_ready_to_send_binding.dart';
import '../modules/collaborators_ready_to_send/views/collaborators_ready_to_send_view.dart';
import '../modules/converter/bindings/converter_binding.dart';
import '../modules/converter/views/converter_view.dart';
import '../modules/create_new_password/bindings/create_new_password_binding.dart';
import '../modules/create_new_password/views/create_new_password_view.dart';
import '../modules/delivery/bindings/delivery_binding.dart';
import '../modules/delivery/views/delivery_view.dart';
import '../modules/delivery_nearby_points/bindings/delivery_nearby_points_binding.dart';
import '../modules/delivery_nearby_points/views/delivery_nearby_points_view.dart';
import '../modules/delivery_order_detail/bindings/delivery_order_detail_binding.dart';
import '../modules/delivery_order_detail/views/delivery_order_detail_view.dart';
import '../modules/delivery_purchases_done/bindings/delivery_purchases_done_binding.dart';
import '../modules/delivery_purchases_done/views/delivery_purchases_done_view.dart';
import '../modules/delivery_purchases_on_the_way/bindings/delivery_purchases_on_the_way_binding.dart';
import '../modules/delivery_purchases_on_the_way/views/delivery_purchases_on_the_way_view.dart';
import '../modules/delivery_purchases_status/bindings/delivery_purchases_status_binding.dart';
import '../modules/delivery_purchases_status/views/delivery_purchases_status_view.dart';
import '../modules/delivery_summary/bindings/delivery_summary_binding.dart';
import '../modules/delivery_summary/views/delivery_summary_view.dart';
import '../modules/edit_address/bindings/edit_address_binding.dart';
import '../modules/edit_address/views/edit_address_view.dart';
import '../modules/favorites/bindings/favorites_binding.dart';
import '../modules/favorites/views/favorites_view.dart';
import '../modules/general_setting/bindings/general_setting_binding.dart';
import '../modules/general_setting/views/general_setting_view.dart';
import '../modules/get_start/bindings/get_start_binding.dart';
import '../modules/get_start/views/get_start_view.dart';
import '../modules/hashtag/bindings/hashtag_binding.dart';
import '../modules/hashtag/views/hashtag_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_view.dart';
import '../modules/help_center/bindings/help_center_binding.dart';
import '../modules/help_center/views/help_center_view.dart';
import '../modules/help_chat/bindings/help_chat_binding.dart';
import '../modules/help_chat/views/help_chat_view.dart';
import '../modules/history_of_movements/bindings/history_of_movements_binding.dart';
import '../modules/history_of_movements/views/history_of_movements_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/invite_collaborator/bindings/invite_collaborator_binding.dart';
import '../modules/invite_collaborator/views/invite_collaborator_view.dart';
import '../modules/invite_collaborator_choose_a_role/bindings/invite_collaborator_choose_a_role_binding.dart';
import '../modules/invite_collaborator_choose_a_role/views/invite_collaborator_choose_a_role_view.dart';
import '../modules/invite_collaborator_choose_a_role_confirm/bindings/invite_collaborator_choose_a_role_confirm_binding.dart';
import '../modules/invite_collaborator_choose_a_role_confirm/views/invite_collaborator_choose_a_role_confirm_view.dart';
import '../modules/invite_collaborator_choose_a_role_send_invitation/bindings/invite_collaborator_choose_a_role_send_invitation_binding.dart';
import '../modules/invite_collaborator_choose_a_role_send_invitation/views/invite_collaborator_choose_a_role_send_invitation_view.dart';
import '../modules/linked_devices/bindings/linked_devices_binding.dart';
import '../modules/linked_devices/views/linked_devices_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_with_email/bindings/login_with_email_binding.dart';
import '../modules/login_with_email/views/login_with_email_view.dart';
import '../modules/my_profile/bindings/my_profile_binding.dart';
import '../modules/my_profile/views/my_profile_view.dart';
import '../modules/my_qr_code/bindings/my_qr_code_binding.dart';
import '../modules/my_qr_code/views/my_qr_code_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/package_preparation/bindings/package_preparation_binding.dart';
import '../modules/package_preparation/views/package_preparation_view.dart';
import '../modules/payment_method/bindings/payment_method_binding.dart';
import '../modules/payment_method/views/payment_method_view.dart';
import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/products_status/bindings/products_status_binding.dart';
import '../modules/products_status/views/products_status_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_detail/bindings/profile_detail_binding.dart';
import '../modules/profile_detail/views/profile_detail_view.dart';
import '../modules/profile_public/bindings/profile_public_binding.dart';
import '../modules/profile_public/views/profile_public_view.dart';
import '../modules/purchases/bindings/purchases_binding.dart';
import '../modules/purchases/views/purchases_view.dart';
import '../modules/purchases_status/bindings/purchases_status_binding.dart';
import '../modules/purchases_status/views/purchases_status_view.dart';
import '../modules/rate_us/bindings/rate_us_binding.dart';
import '../modules/rate_us/views/rate_us_view.dart';
import '../modules/recharge/bindings/recharge_binding.dart';
import '../modules/recharge/views/recharge_view.dart';
import '../modules/recharge_done/bindings/recharge_done_binding.dart';
import '../modules/recharge_done/views/recharge_done_view.dart';
import '../modules/recharge_summary/bindings/recharge_summary_binding.dart';
import '../modules/recharge_summary/views/recharge_summary_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/reset_password_mail/bindings/reset_password_mail_binding.dart';
import '../modules/reset_password_mail/views/reset_password_mail_view.dart';
import '../modules/sales/bindings/sales_binding.dart';
import '../modules/sales/views/sales_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/sign_up_with_email/bindings/sign_up_with_email_binding.dart';
import '../modules/sign_up_with_email/views/sign_up_with_email_view.dart';
import '../modules/something_went_wrong/bindings/something_went_wrong_binding.dart';
import '../modules/something_went_wrong/views/something_went_wrong_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/sub_category/bindings/sub_category_binding.dart';
import '../modules/sub_category/views/sub_category_view.dart';
import '../modules/sub_category_products/bindings/sub_category_products_binding.dart';
import '../modules/sub_category_products/views/sub_category_products_view.dart';
import '../modules/subscription/bindings/subscription_binding.dart';
import '../modules/subscription/views/subscription_view.dart';
import '../modules/two_step_verification/bindings/two_step_verification_binding.dart';
import '../modules/two_step_verification/views/two_step_verification_view.dart';
import '../modules/two_step_verification_otp/bindings/two_step_verification_otp_binding.dart';
import '../modules/two_step_verification_otp/views/two_step_verification_otp_view.dart';
import '../modules/two_step_verification_two/bindings/two_step_verification_two_binding.dart';
import '../modules/two_step_verification_two/views/two_step_verification_two_view.dart';
import '../modules/upload/bindings/upload_binding.dart';
import '../modules/upload/views/upload_view.dart';
import '../modules/wallet/bindings/wallet_binding.dart';
import '../modules/wallet/views/wallet_view.dart';
import '../modules/withdraw/bindings/withdraw_binding.dart';
import '../modules/withdraw/views/withdraw_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_YOUR_MAIL,
      page: () => const CheckYourMailView(),
      binding: CheckYourMailBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_PASSWORD,
      page: () => const CreateNewPasswordView(),
      binding: CreateNewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => const MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: _Paths.RATE_US,
      page: () => const RateUsView(),
      binding: RateUsBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_WITH_EMAIL,
      page: () => const LoginWithEmailView(),
      binding: LoginWithEmailBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_WITH_EMAIL,
      page: () => const SignUpWithEmailView(),
      binding: SignUpWithEmailBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD_MAIL,
      page: () => const ResetPasswordMailView(),
      binding: ResetPasswordMailBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => const ChatsView(),
      binding: ChatsBinding(),
    ),
    GetPage(
      name: _Paths.MY_QR_CODE,
      page: () => const MyQrCodeView(),
      binding: MyQrCodeBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: _Paths.HELP_CHAT,
      page: () => const HelpChatView(),
      binding: HelpChatBinding(),
    ),
    GetPage(
      name: _Paths.HELP_CENTER,
      page: () => const HelpCenterView(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD,
      page: () => const UploadView(),
      binding: UploadBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.MY_ADD_PRODUCT_DETAIL,
      page: () => const MyAddProductDetailView(),
      binding: MyAddProductBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS_STATUS,
      page: () => const ProductsStatusView(),
      binding: ProductsStatusBinding(),
    ),
    GetPage(
      name: _Paths.HASHTAG,
      page: () => const HashtagView(),
      binding: HashtagBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DETAIL,
      page: () => const ProfileDetailView(),
      binding: ProfileDetailBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_DETAIL,
      page: () => const ChatDetailView(),
      binding: ChatDetailBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGE_PREPARATION,
      page: () => const PackagePreparationView(),
      binding: PackagePreparationBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASES_STATUS,
      page: () => const PurchasesStatusView(),
      binding: PurchasesStatusBinding(),
    ),
    GetPage(
      name: _Paths.GENERAL_SETTING,
      page: () => const GeneralSettingView(),
      binding: GeneralSettingBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.TWO_STEP_VERIFICATION,
      page: () => const TwoStepVerificationView(),
      binding: TwoStepVerificationBinding(),
    ),
    GetPage(
      name: _Paths.APP_UNLOCK,
      page: () => const AppUnlockView(),
      binding: AppUnlockBinding(),
    ),
    GetPage(
      name: _Paths.LINKED_DEVICES,
      page: () => const LinkedDevicesView(),
      binding: LinkedDevicesBinding(),
    ),
    GetPage(
      name: _Paths.COLLABORATOR,
      page: () => const CollaboratorView(),
      binding: CollaboratorBinding(),
    ),
    GetPage(
      name: _Paths.SALES,
      page: () => const SalesView(),
      binding: SalesBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASES,
      page: () => const PurchasesView(),
      binding: PurchasesBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () => const SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PUBLIC,
      page: () => const ProfilePublicView(),
      binding: ProfilePublicBinding(),
    ),
    GetPage(
      name: _Paths.SOMETHING_WENT_WRONG,
      page: () => const SomethingWentWrongView(),
      binding: SomethingWentWrongBinding(),
    ),
    GetPage(
      name: _Paths.COLLABORATORS_READY_TO_SEND,
      page: () => const CollaboratorsReadyToSendView(),
      binding: CollaboratorsReadyToSendBinding(),
    ),
    GetPage(
      name: _Paths.INVITE_COLLABORATOR,
      page: () => const InviteCollaboratorView(),
      binding: InviteCollaboratorBinding(),
    ),
    GetPage(
      name: _Paths.INVITE_COLLABORATOR_CHOOSE_A_ROLE,
      page: () => const InviteCollaboratorChooseARoleView(),
      binding: InviteCollaboratorChooseARoleBinding(),
    ),
    GetPage(
      name: _Paths.INVITE_COLLABORATOR_CHOOSE_A_ROLE_CONFIRM,
      page: () => const InviteCollaboratorChooseARoleConfirmView(),
      binding: InviteCollaboratorChooseARoleConfirmBinding(),
    ),
    GetPage(
      name: _Paths.INVITE_COLLABORATOR_CHOOSE_A_ROLE_SEND_INVITATION,
      page: () => const InviteCollaboratorChooseARoleSendInvitationView(),
      binding: InviteCollaboratorChooseARoleSendInvitationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_ACCOUNT,
      page: () => const AddNewAccountView(),
      binding: AddNewAccountBinding(),
    ),
    GetPage(
      name: _Paths.BANK_INFORMATION,
      page: () => const BankInformationView(),
      binding: BankInformationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_BANK,
      page: () => const AddNewBankView(),
      binding: AddNewBankBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_CARD,
      page: () => const AddNewCardView(),
      binding: AddNewCardBinding(),
    ),
    GetPage(
      name: _Paths.TWO_STEP_VERIFICATION_TWO,
      page: () => const TwoStepVerificationTwoView(),
      binding: TwoStepVerificationTwoBinding(),
    ),
    GetPage(
      name: _Paths.TWO_STEP_VERIFICATION_OTP,
      page: () => const TwoStepVerificationOtpView(),
      binding: TwoStepVerificationOtpBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.RECHARGE,
      page: () => const RechargeView(),
      binding: RechargeBinding(),
    ),
    GetPage(
      name: _Paths.RECHARGE_SUMMARY,
      page: () => const RechargeSummaryView(),
      binding: RechargeSummaryBinding(),
    ),
    GetPage(
      name: _Paths.RECHARGE_DONE,
      page: () => const RechargeDoneView(),
      binding: RechargeDoneBinding(),
    ),
    GetPage(
      name: _Paths.WITHDRAW,
      page: () => const WithdrawView(),
      binding: WithdrawBinding(),
    ),
    GetPage(
      name: _Paths.CONVERTER,
      page: () => const ConverterView(),
      binding: ConverterBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_OF_MOVEMENTS,
      page: () => const HistoryOfMovementsView(),
      binding: HistoryOfMovementsBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNTS,
      page: () => const AccountsView(),
      binding: AccountsBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE,
      page: () => const ChangeView(),
      binding: ChangeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DELIVERY_ADDRESS,
      page: () => const AddDeliveryAddressView(),
      binding: AddDeliveryAddressBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHOD,
      page: () => const PaymentMethodView(),
      binding: PaymentMethodBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY,
      page: () => const DeliveryView(),
      binding: DeliveryBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_NEARBY_POINTS,
      page: () => const DeliveryNearbyPointsView(),
      binding: DeliveryNearbyPointsBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_PURCHASES_STATUS,
      page: () => const DeliveryPurchasesStatusView(),
      binding: DeliveryPurchasesStatusBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_SUMMARY,
      page: () => const DeliverySummaryView(),
      binding: DeliverySummaryBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ADDRESS,
      page: () => const EditAddressView(),
      binding: EditAddressBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_PURCHASES_DONE,
      page: () => const DeliveryPurchasesDoneView(),
      binding: DeliveryPurchasesDoneBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_PURCHASES_ON_THE_WAY,
      page: () => const DeliveryPurchasesOnTheWayView(),
      binding: DeliveryPurchasesOnTheWayBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_ORDER_DETAIL,
      page: () => const DeliveryOrderDetailView(),
      binding: DeliveryOrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.SUB_CATEGORY,
      page: () => const SubCategoryView(),
      binding: SubCategoryBinding(),
    ),
    GetPage(
      name: _Paths.SUB_CATEGORY_PRODUCTS,
      page: () => const SubCategoryProductsView(),
      binding: SubCategoryProductsBinding(),
    ),
    GetPage(
      name: _Paths.GET_START,
      page: () => const GetStartView(),
      binding: GetStartBinding(),
    ),
  ];
}
