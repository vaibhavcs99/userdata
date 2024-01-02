import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:userdata/core/error/network_error.dart';
import 'package:userdata/data/data_sources/remote_data_sources/user/user_remote_data_source.dart';
import 'package:userdata/data/models/user_details_model.dart';
import 'package:userdata/data/models/users_list_model.dart';
import 'package:userdata/domain/entities/user_details_entity.dart';
import 'package:userdata/domain/entities/user_list_entity.dart';
import 'package:userdata/domain/repositories/user_repository.dart';
import 'package:userdata/domain/usecases/fetch_user_details_usecase.dart';
import 'package:userdata/domain/usecases/fetch_user_list_usecase.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<Either<NetworkError, UserList>> fetchUserList(
      {required FetchUserListUseCaseParams params}) async {
    try {
      final Response response =
          await userDataSource.fetchUserList(params: params);
      UsersListModel data = usersListFromJson(response.data);
      return Right(data.modelToEntity());
    } catch (e) {
      return Left(NetworkError());
    }
  }

  @override
  Future<Either<NetworkError, UserDetails>> fetchUserDetails(
      {required FetchUserDetailsUseCaseParams params}) async {
    try {
      final Response response =
          await userDataSource.fetchUserDetails(params: params);
      UserDetailsModel data = userDetailsFromJson(response.data);
      return Right(data.modelToEntity());
    } catch (e) {
      return Left(NetworkError());
    }
  }
}
