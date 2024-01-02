part of 'users_list_cubit.dart';

abstract class UsersListState extends Equatable {}

class UsersListInitialState extends UsersListState {
  @override
  List<Object?> get props => [];
}

class UsersListLoadingState extends UsersListState {
  @override
  List<Object?> get props => [];
}

class UsersListErrorState extends UsersListState {
  @override
  List<Object?> get props => [];
}

class UserListFetchedSuccessState extends UsersListState {
  final List<UserData> userDataList;

  UserListFetchedSuccessState({required this.userDataList});

  @override
  List<Object?> get props => [userDataList,DateTime.now()];
}
