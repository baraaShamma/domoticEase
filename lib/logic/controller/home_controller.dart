import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/function/handling_data_controller.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:domotic_ease/data/datasource/remote/home_data.dart';
import 'package:domotic_ease/data/model/device_model.dart';
import 'package:domotic_ease/link_api.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/class/socket_channel.dart';

abstract class HomeController extends GetxController {
  intialData();

  getRooms();

  changeRoom(id, name);

  getDevices();

  updateDeviceState(
      String id_device, String state, String idEsp, String pinNumberOutput);
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
  late StatusRequest statusRequest;
  StatusRequest statusRequestDevices = StatusRequest.none;
  late SocketChannel socketChannel;
  Set<String> idEsp = <String>{};

  void sendMessage(String id_esp, String pinOut, String state) {
    socketChannel.sendMessage("esp_id:$id_esp:$pinOut:$state:esp");
  }

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
    // WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(AppLink.webSocket) );
    // try {
    //   await channel.ready;
    // } catch (e) {
    //   // handle exception here
    //   print("WebsocketChannel was unable to establishconnection");
    // }
    //
    // Stream stream = channel.stream;
    // stream.listen((event) {
    //   print('Event from Stream: $event');
    //
    // },onError: (e){
    //
    //   // handle stream error
    // },
    //     onDone: (() {
    //       // stream on done callback...
    //     }),
    //     cancelOnError: true
    // );
    // try {
    //   socketChannel = IOWebSocketChannel.connect(Uri.parse(AppLink.webSocket));
    //   socketChannel.stream.listen(
    //     (dynamic message) {
    //       print('message $message');
    //     },
    //     onDone: () {
    //       print('ws channel closed');
    //     },
    //     cancelOnError: true,
    //     onError: (error) {
    //       print('ws error $error');
    //     },
    //   );
    // } catch (e) {
    //   print("object");
    // }
    socketChannel= SocketChannel(() => WebSocketChannel.connect(Uri.parse(AppLink.webSocket)));
    socketChannel.stream.listen((event) {
      baraa(event);
    });
  }

  late String idDevice;
  late String stateDevice;

  void baraa(String data) {
    List<String> parts = data.split(':');
    if (parts.length > 1) {
      String firstPart = parts[0];
      String secondPart = parts[1];
      if (idEsp.contains(firstPart)) {
        if (secondPart == "update") {
          Get.snackbar("50".tr, "51".tr,
              duration: const Duration(milliseconds: 700));
          getDevices();
        }
        if (secondPart == "on") {
          Get.snackbar("50".tr, "52".tr,
              duration: const Duration(milliseconds: 700));
          updateDevice(idDevice, stateDevice);
        }
        if (secondPart == "off") {
          Get.snackbar("50".tr, "53".tr,
              duration: const Duration(milliseconds: 700));
          updateDevice(idDevice, stateDevice);
        }
        if (secondPart == "offDev") {
          Get.snackbar("50".tr, "54".tr,
              duration: const Duration(milliseconds: 700));
          updateDevice(idDevice, stateDevice);
        }
        if (secondPart == "onDev") {
          Get.snackbar("50".tr, "54".tr,
              duration: const Duration(milliseconds: 700));
          updateDevice(idDevice, stateDevice);
        }
        // getDevices();
      }
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
    update();
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
  updateDeviceState(String id_device, String state, String idEsp,
      String pinNumberOutput) async {
    if (state == "1") {
      sendMessage(idEsp, pinNumberOutput, "1");
      idDevice = id_device;
      stateDevice = state;
      update();
    } else {
      sendMessage(idEsp, pinNumberOutput, "0");
      idDevice = id_device;
      stateDevice = state;
      update();
    }
  }

  updateDevice(String id_device, String state) async {
    devices.clear();
    statusRequestDevices = StatusRequest.loading;
    update();
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
