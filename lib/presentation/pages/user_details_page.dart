import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userdata/presentation/cubits/user_details/user_details_cubit.dart';
import 'package:userdata/presentation/widgets/app_error_widget.dart';
import 'package:userdata/presentation/widgets/user_details_row_widget.dart';

import '../widgets/progress_indicator.dart';

class UserDetailsPage extends StatefulWidget {
  final String? userId;
  final String? firstName;
  const UserDetailsPage(
      {super.key, required this.userId, required this.firstName});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    context.read<UserDetailsCubit>().emitInitialState();

    return Scaffold(
        appBar: AppBar(title: Text('${widget.firstName} Details')),
        body: BlocConsumer<UserDetailsCubit, UserDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UserDetailsInitialState) {
              context.read<UserDetailsCubit>().getData(userId: widget.userId);
              return const AppCircularProgressIndicator();
            }
            if (state is UserDetailsLoadingState) {
              return const AppCircularProgressIndicator();
            }
            if (state is UsersDetailsErrorState) {
              return const AppErrorWidget();
            }
            if (state is UserDetailsFetchedSuccessState) {
              var userData = state.userDetails.data;
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 60),
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: userData.avatar != null
                            ? CircleAvatar(
                                foregroundImage: NetworkImage(userData.avatar!))
                            : const SizedBox.shrink(),
                      ),
                    ),
                    const Divider(),
                    UserDetailsRowWidget(
                        title: 'First Name', description: userData.firstName),
                    UserDetailsRowWidget(
                        title: 'Last Name', description: userData.lastName),
                    UserDetailsRowWidget(
                        title: 'Email', description: userData.email),
                    const Divider(),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
