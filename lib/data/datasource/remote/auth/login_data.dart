import 'package:domotic_ease/core/class/crud.dart';
import 'package:domotic_ease/link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {

  var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
