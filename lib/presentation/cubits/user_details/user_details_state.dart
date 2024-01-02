part of 'user_details_cubit.dart';

abstract class UserDetailsState extends Equatable {}

class UserDetailsInitialState extends UserDetailsState {
  @override
  List<Object?> get props =>[];
}

class UsersDetailsErrorState extends UserDetailsState {
  @override
  List<Object?> get props =>[];
}

class UserDetailsLoadingState extends UserDetailsState {
  @override
  List<Object?> get props => [];
}

class UserDetailsFetchedSuccessState extends UserDetailsState {
  final UserDetails userDetails;

  UserDetailsFetchedSuccessState({required this.userDetails});

  @override
  List<Object?> get props => [userDetails];
}
