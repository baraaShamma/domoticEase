class AppLink {
  static String apiUser = 'http://192.168.1.108:8000/api/users';
  static String webSocket = 'ws://192.168.1.108:8585';

  //auth

  static String login = "$apiUser/login";

  //forgetPassword
  static String checkEmail = "$apiUser/forgetpassword/check_email.php";
  static String resetPassword = "$apiUser/forgetpassword/reset_password.php";
  static String verifyCodeResetPassword = "$apiUser/forgetpassword/verify_code.php";

  //rooms
  static String rooms = '$apiUser/rooms';
  static String devices = '$apiUser/devices';
  static String updateDeviceState = '$apiUser/updateDeviceState';


  //Profile
  static String secondaryUsersDetails = '$apiUser/getUserDetails';
  static String addSecondaryUser = '$apiUser/addSecondaryUser';
  static String addSecondaryRoom = '$apiUser/addSecondaryRoom';


}
