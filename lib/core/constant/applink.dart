class AppLink {
  static const String server = 'https://atowi7.com/ECommerce_app'; // buy host
  static const String test = '$server/test.php';

  //Auth
  static const String signup = '$server/auth/signup.php';
  static const String verifyCode = '$server/auth/verifycode.php';
  static const String login = '$server/auth/login.php';
  static const String checkemail = '$server/forgetpassword/checkemail.php';
  static const String verifycode = '$server/forgetpassword/verifycode.php';
  static const String resetpassword =
      '$server/forgetpassword/resetpassword.php';
}
