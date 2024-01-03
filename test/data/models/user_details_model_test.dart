import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:userdata/data/models/user_details_model.dart';

void main() {
  test('userDetailsFromJson should correctly parse JSON', () async {
//Arrange
    final file = File('test/test_resources/user_details_response.json');
    String fileContent = await file.readAsString();

//Act
    UserDetailsModel data = userDetailsFromJson(jsonDecode(fileContent));

//Assert
    expect(data.data?.firstName, 'Janet');
    expect(data.data?.lastName, 'Weaver');
    expect(data.data?.email, 'janet.weaver@reqres.in');
    expect(data.data?.avatar, 'https://reqres.in/img/faces/2-image.jpg');
    expect(data.data?.id, 2);
  });
}
