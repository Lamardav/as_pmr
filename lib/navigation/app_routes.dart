import 'package:as_pmr/common/constants.dart';
import 'package:as_pmr/navigation/tabs/tabs.dart';
import 'package:as_pmr/screens/home/home.dart';
import 'package:as_pmr/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String root = '/tabs';
  static const String main = '/tabs/main';
  static const String profile = '/tabs/profile';

  static final Map<String, Widget> appRoutesMap = {
    root: const Tabs(),
    main: const HomeScreen(),
    profile: const ProfileScreen()
  };

  static Route<dynamic> getRouteBuilder(RouteSettings settings) {
    final String? routeName;
    routeName = root;

    if (!appRoutesMap.containsKey(routeName)) {
      throw Exception('app route not found');
    }

    return Constants.isAndroid
        ? MaterialPageRoute(
            builder: (context) => appRoutesMap[routeName]!,
            settings: settings,
          )
        : CupertinoPageRoute(
            builder: (context) => appRoutesMap[routeName]!,
            settings: settings,
          );
  }
}
