// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString?);

import 'dart:convert';

import 'package:userdata/domain/entities/user_details_entity.dart';

UserDetailsModel userDetailsFromJson(dynamic str) =>
    UserDetailsModel.fromJson((str));

String? userDetailsToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsDataModel? data;

  UserDetailsModel({
    required this.data,
  });

  factory UserDetailsModel.fromJson(Map<String?, dynamic> json) =>
      UserDetailsModel(
        data: UserDetailsDataModel.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class UserDetailsDataModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDetailsDataModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserDetailsDataModel.fromJson(Map<String?, dynamic> json) =>
      UserDetailsDataModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

extension UserDetailsModelToEntity on UserDetailsModel {
  UserDetails modelToEntity() {
    return UserDetails(
        data: data?.modelToEntity() ??
            UserDetailsData(
                id: 0, email: '', firstName: '', lastName: '', avatar: ''));
  }
}

extension UserDetailsDataModelToEntity on UserDetailsDataModel {
  UserDetailsData modelToEntity() {
    return UserDetailsData(
        id: id??0,
        email: email??'',
        firstName: firstName??'',
        lastName: lastName??'',
        avatar: avatar??'');
  }
}
