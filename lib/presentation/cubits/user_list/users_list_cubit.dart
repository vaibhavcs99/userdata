import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:userdata/domain/entities/user_list_entity.dart';
import 'package:userdata/domain/usecases/fetch_user_list_usecase.dart';

part 'users_list_state.dart';

class UsersListCubit extends Cubit<UsersListState> {
  int? currentPage = 1;
  int? perPage = 8;
  int? totalPages = 1;
  List<UserData> userDataList = [];
  RefreshController refreshController = RefreshController();
  final FetchUserListUseCase fetchUserListUseCase;

  UsersListCubit({required this.fetchUserListUseCase})
      : super(UsersListInitialState());

  Future<void> getData() async {
    emit(UsersListLoadingState());

    var response = await fetchUserListUseCase.execute(
        params: FetchUserListUseCaseParams(page: '1', perPage: '$perPage'));

    response.fold((l) {
      emit(UsersListErrorState());
    }, (UserList usersList) {
      currentPage = usersList.page;
      totalPages = usersList.totalPages;
      userDataList = usersList.data;

      emit(UserListFetchedSuccessState(userDataList: userDataList));
    });
  }

  Future<void> getNextData() async {
    var response = await fetchUserListUseCase.execute(
        params: FetchUserListUseCaseParams(
            page: '${(currentPage ?? 1) + 1}', perPage: '$perPage'));

    response.fold((l) {
      emit(UsersListErrorState());
    }, (UserList usersList) {
      currentPage = usersList.page;
      totalPages = usersList.totalPages;
      userDataList.addAll(usersList.data);
      
      emit(UserListFetchedSuccessState(userDataList: userDataList));

    });
  }
}
