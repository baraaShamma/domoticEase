
import 'dart:convert';

List<SecondaryUsersModel> secondaryUsersModelFromJson(String str) => List<SecondaryUsersModel>.from(json.decode(str).map((x) => SecondaryUsersModel.fromJson(x)));

String secondaryUsersModelToJson(List<SecondaryUsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SecondaryUsersModel {
  int secondaryUsersId;
  String name;
  String username;

  SecondaryUsersModel({
    required this.secondaryUsersId,
    required this.name,
    required this.username,
  });

  factory SecondaryUsersModel.fromJson(Map<String, dynamic> json) => SecondaryUsersModel(
    secondaryUsersId: json["secondary_users_id"],
    name: json["name"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "secondary_users_id": secondaryUsersId,
    "name": name,
    "username": username,
  };
}
