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
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.azure,
          elevation: 0,
          titleSpacing: 0,
        ),
        primarySwatch: MaterialColor(
          AppColors.azure.value,
          {
            50: AppColors.azure.withOpacity(.1),
            100: AppColors.azure.withOpacity(.2),
            200: AppColors.azure.withOpacity(.3),
            300: AppColors.azure.withOpacity(.4),
            400: AppColors.azure.withOpacity(.5),
            500: AppColors.azure.withOpacity(.6),
            600: AppColors.azure.withOpacity(.7),
            700: AppColors.azure.withOpacity(.8),
            800: AppColors.azure.withOpacity(.9),
            900: AppColors.azure.withOpacity(1),
          },
        ),
      ),
    );
  }
}
