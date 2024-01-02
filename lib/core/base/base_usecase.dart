import 'package:dartz/dartz.dart';
import 'package:userdata/core/error/base_error.dart';
import 'package:userdata/core/params/params.dart';

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  Future<Either<E, T>> execute({required P params});
}
