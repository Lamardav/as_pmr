import 'package:as_pmr/common/theme/colors.dart';
import 'package:as_pmr/navigation/navigation.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GorodPay Demo',
      onGenerateRoute: AppRoutes.getRouteBuilder,
      navigatorObservers: [NavigationHistoryObserver()],
      navigatorKey: navigatorKey,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.transparent,
          elevation: 0,
          titleSpacing: 0,
        ),
      ),
    );
  }
}
