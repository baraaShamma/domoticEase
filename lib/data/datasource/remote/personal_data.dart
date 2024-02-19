import 'package:domotic_ease/core/class/crud.dart';
import 'package:domotic_ease/link_api.dart';

class PersonalData {
  Crud crud;

  PersonalData(this.crud);

  getSecondaryUsersDetails(String idUser) async {
    var response =
        await crud.postData(AppLink.secondaryUsersDetails, {"id_user": idUser});
    return response.fold((l) => l, (r) => r);
  }

  addSecondaryUser(
      String name, String username, String password, String idUser) async {
    var response = await crud.postData(AppLink.addSecondaryUser, {
      "name": name,
      "username": username,
      "password": password,
      "id_user": idUser
    });
    return response.fold((l) => l, (r) => r);
  }

  addSecondaryRoom(String idSecondaryUser, String idRoom) async {
    var response = await crud.postData(AppLink.addSecondaryRoom,
        {"id_secondary_user": idSecondaryUser, "id_room": idRoom});
    return response.fold((l) => l, (r) => r);
  }
}
