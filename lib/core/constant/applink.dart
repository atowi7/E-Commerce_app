class AppLink {
  static const String server = 'https://atowi7.com/ECommerce_app';
  static const String test = '$server/test.php';

  //image
  static const String image = '$server/upload';
  static const String userImage = '$image/categorie';
  static const String categrieImage = '$image/categorie';
  static const String productImage = '$image/product';

  //Auth
  static const String signup = '$server/auth/signup.php';
  static const String signupVerifyCode = '$server/auth/verifycode.php';
  static const String resendVerifyCode = '$server/auth/resendverifycode.php';
  static const String login = '$server/auth/login.php';
  static const String checkemail = '$server/forget_password/checkemail.php';
  static const String verifyCode = '$server/forget_password/verifycode.php';
  static const String resetpassword =
      '$server/forget_password/resetpassword.php';

  //Home
  static const String home = '$server/home.php';

  //product
  static const String productView = '$server/product/view.php';
  static const String productSearch = '$server/product/search.php';
  static const String productRatingPermission =
      '$server/product/ratingpermission.php';
  static const String productrate = '$server/product/rate.php';

  //message
  static const String messageAdd = '$server/message/add.php';

  //favorite
  static const String userfavorite = '$server/favorite/view.php';
  static const String deleteFromuserfavorite =
      '$server/favorite/deletefromuserfav.php';
  static const String favoriteAdd = '$server/favorite/add.php';
  static const String favoriteDelete = '$server/favorite/delete.php';

  //cart
  static const String cartview = '$server/cart/view.php';
  static const String cartAdd = '$server/cart/add.php';
  static const String cartDelete = '$server/cart/delete.php';
  static const String cartDeleteByUser = '$server/cart/deletebyuser.php';
  static const String getcount = '$server/cart/getcount.php';
  static const String chechcoupon = '$server/coupon/check.php';

  //address
  static const String addressview = '$server/address/view.php';
  static const String addressAdd = '$server/address/add.php';
  static const String addressEdit = '$server/address/edit.php';
  static const String addressDelete = '$server/address/delete.php';

  //Orders
  static const String checkoutOrders = '$server/orders/checkout.php';
  static const String ordersView = '$server/orders/view.php';
  static const String ordersArchive = '$server/orders/archive.php';
  static const String ordersDetials = '$server/orders/details.php';
  static const String ordersDelete = '$server/orders/delete.php';

  //Notification
  static const String notificationView = '$server/notification/view.php';
  static const String notificationDelete = '$server/notification/delete.php';

  //Offers
  static const String offers = '$server/offers.php';
}
