import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/middlware/mymiddleware.dart';
import 'package:ecommerce_app2/view/screen/address/add_address.dart';
import 'package:ecommerce_app2/view/screen/address/add_address_details.dart';
import 'package:ecommerce_app2/view/screen/animated_splash.dart';
import 'package:ecommerce_app2/view/screen/auth/add_user_image.dart';
import 'package:ecommerce_app2/view/screen/auth/forgetpassword/checkemail.dart';
import 'package:ecommerce_app2/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app2/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommerce_app2/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_app2/view/screen/auth/login.dart';
import 'package:ecommerce_app2/view/screen/auth/signup.dart';
import 'package:ecommerce_app2/view/screen/auth/success_signup.dart';
import 'package:ecommerce_app2/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_app2/view/screen/cart/cart.dart';
import 'package:ecommerce_app2/view/screen/checkout/checkout.dart';
import 'package:ecommerce_app2/view/screen/coupons/coupon.dart';
import 'package:ecommerce_app2/view/screen/items/itemsdetails.dart';
import 'package:ecommerce_app2/view/screen/items/items.dart';
import 'package:ecommerce_app2/view/screen/homepage/homepagescreen.dart';
import 'package:ecommerce_app2/view/screen/favorite/myfavorite.dart';
import 'package:ecommerce_app2/view/screen/language/language.dart';
import 'package:ecommerce_app2/view/screen/offers/offers.dart';
import 'package:ecommerce_app2/view/screen/onboarding/onboarding.dart';
import 'package:ecommerce_app2/view/screen/orders/archieve_orders.dart';
import 'package:ecommerce_app2/view/screen/orders/details.dart';
import 'package:ecommerce_app2/view/screen/orders/tracking_order.dart';
import 'package:ecommerce_app2/view/screen/settings/change_user_profile.dart';
import 'package:ecommerce_app2/view/screen/settings/settings.dart';
import 'package:get/get.dart';
import 'view/screen/address/view_address.dart';
import 'view/screen/orders/pending_orders.dart';

List<GetPage<dynamic>>? routes = [
   GetPage( 
  name: "/" ,
    page: () => const SplashScreen(),
  ), 
   
  GetPage(
    name: AppRotes.language,
    page: () => const Language(),
    middlewares: [
      MyMiddleWare(),
    ],
  ),

  GetPage(
    name: AppRotes.login,
    page: () => const Login(),
  ),

  GetPage(
    name: AppRotes.addUserImage,
    page: () => const AddUserImage(),
  ),
  GetPage(
    name: AppRotes.changeUserImageProfile,
    page: () => const ChangeUserImageProfile(),
  ),

  GetPage(
    name: AppRotes.signUp,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRotes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRotes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRotes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRotes.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRotes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRotes.verifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(
    name: AppRotes.onBoarding,
    page: () => const OnBoarding(),
  ),

  //home page
  GetPage(
    name: AppRotes.homePage,
    page: () => const HomePageScreen(),
  ),
  GetPage(
    name: AppRotes.itemsHomePage,
    page: () => const ItemsHomePage(),
  ),
  GetPage(
    name: AppRotes.itemsDetails,
    page: () => const ItemsDetails(),
  ),
  GetPage(
    name: AppRotes.myFavorite,
    page: () => const MyFavorite(),
  ),
  GetPage(
    name: AppRotes.cart,
    page: () => const Cart(),
  ),

  //
  GetPage(
    name: AppRotes.addressView,
    page: () => const AddressView(),
  ),
  GetPage(
    name: AppRotes.addressAdd,
    page: () => const AddressAdd(),
  ),
  GetPage(
    name: AppRotes.addressAddDetails,
    page: () => const AddressAddDetails(),
  ),

  // orders =====
  GetPage(
    name: AppRotes.checkout,
    page: () => const Checkout(),
  ),
  GetPage(
    name: AppRotes.pendingOrders,
    page: () => const PendingOrders(),
  ),
  GetPage(
    name: AppRotes.ordersDetails,
    page: () => const OrdersDetails(),
  ),
  GetPage(
    name: AppRotes.ordersArchieved,
    page: () => const ArchievedOrders(),
  ),

  GetPage(
    name: AppRotes.ordersTracking,
    page: () => const OrdersTracing(),
  ),

  // settings

  GetPage(
    name: AppRotes.settings,
    page: () => const Settings(),
  ),

  GetPage(
    name: AppRotes.couponPage,
    page: () => const CouponPageView(),
  ),
  GetPage(
    name: AppRotes.offersView,
    page: () => const OffersView(),
  ),
];
