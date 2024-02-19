import 'package:domotic_ease/core/class/crud.dart';
import 'package:domotic_ease/link_api.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email
    });
    return response.fold((l) => l, (r) => r);
  }
}
