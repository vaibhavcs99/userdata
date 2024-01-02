import 'package:flutter/material.dart';
import 'package:userdata/core/screen_arguments/arguments_type.dart';
import 'package:userdata/core/routing/routes.dart';
import 'package:userdata/domain/entities/user_list_entity.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.userDetailsRoute,
              arguments: UserDetailsArguments(
                  userId: userData.id.toString(),
                  firstName: userData.firstName));
        },
        child: Card(
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 80,
                width: 80,
                child: userData.avatar != null
                    ? CircleAvatar(
                        radius: 20,
                        foregroundImage: NetworkImage(userData.avatar!),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '${userData.firstName} ${userData.lastName}',
                style: const TextStyle(fontSize: 18),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
