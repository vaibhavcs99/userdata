import 'package:dartz/dartz.dart';
import 'package:userdata/core/base/base_usecase.dart';
import 'package:userdata/core/error/network_error.dart';
import 'package:userdata/core/params/params.dart';
import 'package:userdata/domain/entities/user_details_entity.dart';
import 'package:userdata/domain/repositories/user_repository.dart';

class FetchUserDetailsUseCase extends BaseUseCase<NetworkError,
    FetchUserDetailsUseCaseParams, UserDetails> {
  final UserRepository userRepository;

  FetchUserDetailsUseCase({required this.userRepository});

  @override
  Future<Either<NetworkError, UserDetails>> execute(
      {required FetchUserDetailsUseCaseParams params}) {
    return userRepository.fetchUserDetails(params: params);
  }
}

class FetchUserDetailsUseCaseParams extends Params {
  final String? userId;

  FetchUserDetailsUseCaseParams({required this.userId});
}
