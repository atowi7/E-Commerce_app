class AppLink {
  static const String server = 'https://atowi7.com/ECommerce_app'; // buy host
  static const String test = '$server/test.php';

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
}
