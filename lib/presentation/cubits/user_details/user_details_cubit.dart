import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:userdata/domain/entities/user_details_entity.dart';
import 'package:userdata/domain/usecases/fetch_user_details_usecase.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final FetchUserDetailsUseCase fetchUserDetailsUseCase;

  UserDetailsCubit({required this.fetchUserDetailsUseCase})
      : super(UserDetailsInitialState());

  Future<void> getData({required String? userId}) async {
    emit(UserDetailsLoadingState());

    var response = await fetchUserDetailsUseCase.execute(
        params: FetchUserDetailsUseCaseParams(userId: userId));

    response.fold((l) {
      emit(UsersDetailsErrorState());
    }, (UserDetails userDetails) {
      emit(UserDetailsFetchedSuccessState(userDetails: userDetails));
    });
  }

  emitInitialState() {
    emit(UserDetailsInitialState());
  }
}
