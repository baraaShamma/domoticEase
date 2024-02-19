// To parse this JSON data, do
//
//     final deviceModel = deviceModelFromJson(jsonString);

import 'dart:convert';

List<DeviceModel> deviceModelFromJson(String str) => List<DeviceModel>.from(json.decode(str).map((x) => DeviceModel.fromJson(x)));

String deviceModelToJson(List<DeviceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeviceModel {
  int deviceId;
  int pinNumberInput;
  String deviceName;
  int pinNumberOutput;
  String state;
  int idEsp;
  int idRoom;
  EspHome espHome;

  DeviceModel({
    required this.deviceId,
    required this.pinNumberInput,
    required this.deviceName,
    required this.pinNumberOutput,
    required this.state,
    required this.idEsp,
    required this.idRoom,
    required this.espHome,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
    deviceId: json["device_id"],
    pinNumberInput: json["pin_number_input"],
    deviceName: json["device_name"],
    pinNumberOutput: json["pin_number_output"],
    state: json["state"],
    idEsp: json["id_esp"],
    idRoom: json["id_room"],
    espHome: EspHome.fromJson(json["esp_home"]),
  );

  Map<String, dynamic> toJson() => {
    "device_id": deviceId,
    "pin_number_input": pinNumberInput,
    "device_name": deviceName,
    "pin_number_output": pinNumberOutput,
    "state": state,
    "id_esp": idEsp,
    "id_room": idRoom,
    "esp_home": espHome.toJson(),
  };
}

class EspHome {
  int espHomeId;
  int idUser;
  String idEsp;

  EspHome({
    required this.espHomeId,
    required this.idUser,
    required this.idEsp,
  });

  factory EspHome.fromJson(Map<String, dynamic> json) => EspHome(
    espHomeId: json["esp_home_id"],
    idUser: json["id_user"],
    idEsp: json["id_esp"],
  );

  Map<String, dynamic> toJson() => {
    "esp_home_id": espHomeId,
    "id_user": idUser,
    "id_esp": idEsp,
  };
}
