// To parse this JSON data, do
//
//     final userDetailModel = userDetailModelFromJson(jsonString);

import 'dart:convert';

UserDetailModel userDetailModelFromJson(String str) => UserDetailModel.fromJson(json.decode(str));

String userDetailModelToJson(UserDetailModel data) => json.encode(data.toJson());

class UserDetailModel {
    int id;
    String name;
    String email;
    String gender;
    String status;

    UserDetailModel({
        required this.id,
        required this.name,
        required this.email,
        required this.gender,
        required this.status,
    });

    factory UserDetailModel.fromJson(Map<String, dynamic> json) => UserDetailModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
    };
}
