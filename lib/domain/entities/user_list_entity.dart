class UserList {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserData> data;

  UserList({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });
}

class UserData {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}
