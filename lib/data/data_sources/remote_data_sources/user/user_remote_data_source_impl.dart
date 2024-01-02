import 'package:dio/dio.dart';
import 'package:userdata/core/services/api_service.dart';
import 'package:userdata/data/data_sources/remote_data_sources/user/user_remote_data_source.dart';
import 'package:userdata/domain/usecases/fetch_user_details_usecase.dart';
import 'package:userdata/domain/usecases/fetch_user_list_usecase.dart';

class UserDataSourceImpl implements UserDataSource {
  final ApiService apiService;

  UserDataSourceImpl({required this.apiService});

  @override
  Future<Response> fetchUserList(
      {required FetchUserListUseCaseParams params}) async {
    Response<dynamic> response = await apiService.getUsersList(
        page: params.page, perPage: params.perPage);

    return response;
  }

  @override
  Future<Response> fetchUserDetails(
      {required FetchUserDetailsUseCaseParams params}) async {
    Response<dynamic> response =
        await apiService.getUserDetails(userId: params.userId);

    return response;
  }
}
