import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:userdata/data/models/users_list_model.dart';

void main() {
  test('usersListFromJson should correctly parse JSON', () async {
//Arrange
    final file = File('test/test_resources/users_list_response.json');
    String fileContent = await file.readAsString();

//Act
    UsersListModel data = usersListFromJson(jsonDecode(fileContent));

//Assert
    expect(data.page, 2);
    expect(data.perPage, 6);
    expect(data.total, 12);
    expect(data.totalPages, 2);
    expect(data.data?.length, 6);
    expect(data.data?[0].firstName, 'Michael');
    expect(data.data?[0].lastName, 'Lawson');
    expect(data.data?[0].id, 7);
    expect(data.data?[0].avatar, 'https://reqres.in/img/faces/7-image.jpg');
    expect(data.data?[0].email, 'michael.lawson@reqres.in');
  });
}
