import 'package:dio/dio.dart';
import 'package:userdata/domain/usecases/fetch_user_details_usecase.dart';
import 'package:userdata/domain/usecases/fetch_user_list_usecase.dart';

abstract class UserDataSource {
  Future<Response<dynamic>> fetchUserList(
      {required FetchUserListUseCaseParams params});

  Future<Response<dynamic>> fetchUserDetails(
      {required FetchUserDetailsUseCaseParams params});
}
