class UserDetails {
  UserDetailsData data;

  UserDetails({
    required this.data,
  });
}

class UserDetailsData {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDetailsData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}
