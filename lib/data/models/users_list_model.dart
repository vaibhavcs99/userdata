// To parse this JSON data, do
//
//     final usersList = usersListFromJson(jsonString);

import 'dart:convert';

import 'package:userdata/domain/entities/user_list_entity.dart';

UsersListModel usersListFromJson(dynamic str) => UsersListModel.fromJson((str));

String? usersListToJson(UsersListModel data) => json.encode(data.toJson());

class UsersListModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserDataModel>? data;

  UsersListModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory UsersListModel.fromJson(Map<String?, dynamic> json) => UsersListModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<UserDataModel>.from(
            json["data"].map((x) => UserDataModel.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data?.map((x) => x.toJson())??[]),
      };
}

class UserDataModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDataModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserDataModel.fromJson(Map<String?, dynamic> json) => UserDataModel(
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

extension UserListModelToEntity on UsersListModel {
  UserList modelToEntity() {
    return UserList(
        page: page,
        perPage: perPage,
        total: total,
        totalPages: totalPages,
        data: data?.modelToEntity()??[]);
  }
}

extension UserDataModelToEntity on List<UserDataModel> {
  List<UserData> modelToEntity() {
    List<UserData> data = [];
    forEach((element) {
      data.add(UserData(
          id: element.id,
          email: element.email,
          firstName: element.firstName,
          lastName: element.lastName,
          avatar: element.avatar));
    });
    return data;
  }
}
