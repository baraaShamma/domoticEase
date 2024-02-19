import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "29".tr;
  }
  if(val.isNotEmpty)
    {
      if (type == "username") {
        if (!GetUtils.isUsername(val)) {
          return "26".tr;
        }
      }
      if (type == "email") {
        if (!GetUtils.isEmail(val)) {
          return "27".tr;
        }
      }

      if (type == "phone") {
        if (!GetUtils.isPhoneNumber(val)) {
          return "28".tr;
        }
      }
      if (type == "SSID") {

      }


      if (val.length < min) {
        return "${"30".tr}$min";
      }

      if (val.length > max) {
        return "${"31".tr} $max";
      }
    }


}