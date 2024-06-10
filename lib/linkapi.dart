class AppLink {
  //const String linkServerName = "http://10.0.2.2/course_php";
  //const String linkServerName = "localhost/ecommerce";
  static const String server =
      "http://10.0.2.2/ecommerce";
      //"https://faressallam.online/ecommerce";
  static const String test = "$server/test.php";

  // images ========================
  static const String imageStatic     = "$server/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems      = "$imageStatic/items";
  static const String usersImage      = "$imageStatic/imageusers";
  static const String defaultImage    = "$imageStatic/userimage/dark.png";

  // =============== Auth ============
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUp = "$server/auth/verifycode.php";
  static const String resendCode = "$server/auth/resend.php";
  static const String updateProfilrUser = "$server/auth/updatauserdata.php";
  static const String viewUserData = "$server/auth/viewuser.php";
  static const String getNotifyVerifyCodeData = "$server/auth/sendnotify.php";

  // Forget Password
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";

  // HomePage
  static const String homePage = "$server/homepage/home.php";
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";

  // Favorites
  static const String favoriteAdd = "$server/favorites/add.php";
  static const String favoriteRemove = "$server/favorites/remove.php";
  static const String favoriteView = "$server/favorites/viewfavorite.php";
  static const String deleteFromfavorite =
      "$server/favorites/deletefromfavorite.php";

  // Cart
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartGetCount = "$server/cart/getcountitems.php";
  static const String cartView = "$server/cart/view.php";

  // Address
  static const String addAddress = "$server/address/add.php";
  static const String deleteAddress = "$server/address/delete.php";
  static const String editAddress = "$server/address/edit.php";
  static const String viewAddress = "$server/address/view.php";

  // checkcoupon
  static const String couponCheck = "$server/coupon/checkcoupon.php";
  static const String couponView = "$server/coupon/viewcoupons.php";

  //checkout || Orders
  static const String checkout = "$server/orders/checkout.php";
  static const String pendingOrders = "$server/orders/pending.php";
  static const String archieveOrders = "$server/orders/archive.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String ordersDelete = "$server/orders/delete.php";

  // paypal =====================
  static const String paypalData = "$server/paypal/add.php";

  //ofers
  static const String offers = "$server/offers/offers.php";
  
  //rating
  static const String rating = "$server/rating/rating.php";

  // Notifications
  static const String notificationsData =
      "$server/notifications/notifications.php";
}
