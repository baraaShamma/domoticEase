// To parse this JSON data, do
//
//     final roomsModel = roomsModelFromJson(jsonString);

import 'dart:convert';

List<RoomsModel> roomsModelFromJson(String str) => List<RoomsModel>.from(json.decode(str).map((x) => RoomsModel.fromJson(x)));

String roomsModelToJson(List<RoomsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoomsModel {
  int roomId;
  String roomName;
  String image;

  RoomsModel({
    required this.roomId,
    required this.roomName,
    required this.image,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(
    roomId: json["room_id"],
    roomName: json["room_name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "room_id": roomId,
    "room_name": roomName,
    "image": image,
  };
}
