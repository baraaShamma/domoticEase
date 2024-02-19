import 'package:dartz/dartz.dart';
import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/function/handling_data_controller.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:domotic_ease/data/datasource/remote/home_data.dart';
import 'package:domotic_ease/data/model/device_model.dart';
import 'package:domotic_ease/link_api.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

import '../../core/class/socket_channel.dart';

// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/status.dart' as status;

abstract class HomeController extends GetxController {
  intialData();

  getRooms();

  changeRoom(id, name);

  getDevices();

  updateDeviceState(String id_device, String state);
}

class HomeControllerImp extends HomeController {
  List rooms = [];
  List<DeviceModel> devices = [];

  int? users_id;
  String? id_room;
  String? name_room;
  String? usernameAr;
  String? usernameEn;
  MyServices myServices = Get.find();

  HomeData homeData = HomeData(Get.find());
  List dataResponse = [];

  void sendMessage(String id_esp, String pinOut, String state) {
    socketChannel.sendMessage("esp_id:$id_esp:$pinOut:$state:esp");
  }

  late StatusRequest statusRequest;
  StatusRequest statusRequestDevices = StatusRequest.none;
  late SocketChannel socketChannel;
  Set<String> idEsp = <String>{};

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() async {
    users_id = myServices.sharedPreferences.getInt("users_id");
    usernameAr = myServices.sharedPreferences.getString("first_name_ar");
    usernameEn = myServices.sharedPreferences.getString("first_name_en");
    await getRooms();
    await getDevices();
    socketChannel =
        SocketChannel(() => IOWebSocketChannel.connect(AppLink.webSocket));
    socketChannel.stream.listen((event) {
      baraa(event);
    });
  }

  void baraa(String id) async {
    if (idEsp.contains(id)) {
      getDevices();
    }
  }

  @override
  changeRoom(id, name) {
    id_room = id.toString();
    name_room = name;
    getDevices();
    update();
  }

  @override
  getRooms() async {
    rooms.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getDataRooms(users_id.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        rooms.addAll(response['data']);
        id_room = rooms[0]["room_id"].toString();
        name_room = rooms[0]["room_name"];
        if (rooms.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.serverFailure;
      }
      // End
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  getDevices() async {
    devices.clear();
    dataResponse.clear();
    statusRequestDevices = StatusRequest.loading;
    var response = await homeData.getDataRoomsDevices(id_room.toString());
    statusRequestDevices = handlingData(response);
    if (StatusRequest.success == statusRequestDevices) {
      if (response['status'] == "success") {
        // devices.addAll(response['data']);
        dataResponse = response['data'];
        devices.addAll(dataResponse.map((e) => DeviceModel.fromJson(e)));
        for (var e in dataResponse) {
          idEsp.add(DeviceModel.fromJson(e).espHome.idEsp);
        }
        if (devices.isEmpty) {
          statusRequestDevices = StatusRequest.failure;
        }
      } else {
        statusRequestDevices = StatusRequest.serverFailure;
      }
    } else {
      statusRequestDevices = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  updateDeviceState(String id_device, String state) async {
    devices.clear();
    statusRequestDevices = StatusRequest.loading;
    var response =
        await homeData.updateDeviceState(id_device.toString(), state);
    statusRequestDevices = handlingData(response);
    if (StatusRequest.success == statusRequestDevices) {
      if (response['status'] == "success") {
        getDevices();
      }
    } else {
      statusRequestDevices = StatusRequest.serverFailure;
    }

    update();
  }

  @override
  void dispose() {
    socketChannel.close();
    super.dispose();
  }
}
