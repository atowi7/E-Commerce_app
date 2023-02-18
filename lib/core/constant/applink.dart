class AppLink {
  static const String server = 'https://atowi7.com/ECommerce_app';
  static const String test = '$server/test.php';

  //image
  static const String image = '$server/upload';
  static const String categrieImage = '$image/categorie';
  static const String productImage = '$image/item';

  //Auth
  static const String signup = '$server/auth/signup.php';
  static const String sifnupVerifyCode = '$server/auth/verifycode.php';
  static const String login = '$server/auth/login.php';
  static const String checkemail = '$server/forget_password/checkemail.php';
  static const String verifyCode = '$server/forget_password/verifycode.php';
  static const String resetpassword =
      '$server/forget_password/resetpassword.php';

  //Home
  static const String home = '$server/home.php';

  //product
  static const String product = '$server/product/view.php';

  //favorite
  static const String userfavorite = '$server/favorite/view.php';
  static const String favoriteAdd = '$server/favorite/add.php';
  static const String favoriteDelete = '$server/favorite/delete.php';
}
