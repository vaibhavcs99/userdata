import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:userdata/presentation/cubits/user_list/users_list_cubit.dart';
import 'package:userdata/presentation/widgets/app_error_widget.dart';
import 'package:userdata/presentation/widgets/user_info_card.dart';

import '../widgets/progress_indicator.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late UsersListCubit userListCubit;

  @override
  Widget build(BuildContext context) {
    userListCubit = context.read<UsersListCubit>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Users List'),
        ),
        body: PopScope(
          canPop: false,
          child: BlocConsumer<UsersListCubit, UsersListState>(
            listener: (context, state) {
                                                                      if (state is UserListFetchedSuccessState) {
                                                                          userListCubit.refreshController.loadComplete();
              }
            },
            builder: (context, UsersListState state) {
              if (state is UsersListInitialState) {
                context.read<UsersListCubit>().getData();
                return const AppCircularProgressIndicator();
              }
              if (state is UsersListLoadingState) {
                return const AppCircularProgressIndicator();
              }
              if (state is UsersListErrorState) {
                return const AppErrorWidget();
              }
              if (state is UserListFetchedSuccessState) {
                return SmartRefresher(
                  enablePullDown: false,
                  enablePullUp: true,
                  onLoading: () {
                    // If current page + 1 i.e. next page is greater than total page then stop the call
                    if ((userListCubit.currentPage ?? 1) + 1 >
                        (userListCubit.totalPages ?? 1)) {
                      userListCubit.refreshController.loadNoData();
                    } else {

                      userListCubit.getNextData();
                    }
                  },
                  controller: userListCubit.refreshController,
                  child: ListView.builder(
                    itemCount: state.userDataList.length,
                    itemBuilder: (context, int index) {
                      var userData = state.userDataList[index];
                      return UserInfoCard(userData: userData);
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ));
  }
}
