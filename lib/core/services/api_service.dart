import 'dart:async';

import 'package:dio/dio.dart';
import 'package:userdata/core/constants/constants.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Response> getUsersList(
      {required String? page, required String? perPage}) async {
    var data = await dio
        .get('${AppConstants.usersBaseUrl}?page=$page&per_page=$perPage');
    return data;
  }

  Future<Response> getUserDetails({required String? userId}) async {
    var data = await dio.get('${AppConstants.usersBaseUrl}/$userId');
    return data;
  }
}
