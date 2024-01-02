import 'package:dartz/dartz.dart';
import 'package:userdata/core/error/network_error.dart';
import 'package:userdata/domain/entities/user_details_entity.dart';
import 'package:userdata/domain/entities/user_list_entity.dart';
import 'package:userdata/domain/usecases/fetch_user_details_usecase.dart';
import 'package:userdata/domain/usecases/fetch_user_list_usecase.dart';

abstract class UserRepository {
  Future<Either<NetworkError, UserList>> fetchUserList(
      {required FetchUserListUseCaseParams params});

  Future<Either<NetworkError, UserDetails>> fetchUserDetails(
      {required FetchUserDetailsUseCaseParams params});
}
