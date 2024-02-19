import 'package:domotic_ease/core/class/crud.dart';
import 'package:domotic_ease/link_api.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getDataRooms(String user_id) async {
    var response = await crud.postData(AppLink.rooms, {"users_id": user_id});
    return response.fold((l) => l, (r) => r);
  }

  getDataRoomsDevices(String roomId) async {
    var response = await crud.postData(AppLink.devices, {"id_room": roomId});
    return response.fold((l) => l, (r) => r);
  }

  updateDeviceState(String device_id, String device_state) async {
    var response = await crud.postData(AppLink.updateDeviceState,
        {"device_id": device_id, "device_state": device_state});
    return response.fold((l) => l, (r) => r);
  }
}
