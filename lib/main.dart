import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userdata/core/routing/routes.dart';
import 'package:userdata/core/services/service_locator.dart';
import 'package:userdata/presentation/cubits/user_details/user_details_cubit.dart';
import 'package:userdata/presentation/cubits/user_list/users_list_cubit.dart';

void main() {
  registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UsersListCubit>(
            create: (context) => UsersListCubit(
                fetchUserListUseCase:
                    locator(instanceName: 'FetchUserListUseCase')),
          ),
          BlocProvider<UserDetailsCubit>(
            create: (context) => UserDetailsCubit(
                fetchUserDetailsUseCase:
                    locator(instanceName: 'FetchUserDetailsUseCase')),
          )
        ],
        child: MaterialApp(
          title: 'User Data',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: Routes.userListRoute,
        ));
  }
}
