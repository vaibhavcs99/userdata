import 'package:dartz/dartz.dart';
import 'package:userdata/core/base/base_usecase.dart';
import 'package:userdata/core/error/network_error.dart';
import 'package:userdata/core/params/params.dart';
import 'package:userdata/domain/entities/user_list_entity.dart';
import 'package:userdata/domain/repositories/user_repository.dart';

class FetchUserListUseCase
    implements BaseUseCase<NetworkError, FetchUserListUseCaseParams, UserList> {
  final UserRepository userRepository;

  FetchUserListUseCase({required this.userRepository});

  @override
  Future<Either<NetworkError, UserList>> execute(
      {required FetchUserListUseCaseParams params}) {
    return userRepository.fetchUserList(params: params);
  }
}

class FetchUserListUseCaseParams implements Params {
  final String? page;
  final String? perPage;

  FetchUserListUseCaseParams({required this.page, required this.perPage});
}
