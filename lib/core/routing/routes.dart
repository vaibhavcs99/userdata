import 'package:flutter/material.dart';
import 'package:userdata/core/screen_arguments/arguments_type.dart';
import 'package:userdata/presentation/pages/user_details_page.dart';
import 'package:userdata/presentation/pages/user_list_page.dart';

class Routes {
  static const String userListRoute = '/user_list_route';
  static const String userDetailsRoute = '/user_details_route';
}

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.userListRoute:
        return MaterialPageRoute(
          builder: (_) => const UserListPage(),
        );
      case Routes.userDetailsRoute:
        final argument = settings.arguments as UserDetailsArguments;

        return MaterialPageRoute(
          builder: (_) => UserDetailsPage(
              userId: argument.userId, firstName: argument.firstName),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Routes'),
        ),
        body: const Center(
          child: Text('No Routes Found'),
        ),
      ),
    );
  }
}
