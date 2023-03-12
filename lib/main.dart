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
      title: 'AS_PMR Demo',
      onGenerateRoute: AppRoutes.getRouteBuilder,
      navigatorObservers: [NavigationHistoryObserver()],
      navigatorKey: navigatorKey,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        backgroundColor: AppColors.background,
        primarySwatch: MaterialColor(
          AppColors.background.value,
          {
            50: AppColors.background.withOpacity(.1),
            100: AppColors.background.withOpacity(.2),
            200: AppColors.background.withOpacity(.3),
            300: AppColors.background.withOpacity(.4),
            400: AppColors.background.withOpacity(.5),
            500: AppColors.background.withOpacity(.6),
            600: AppColors.background.withOpacity(.7),
            700: AppColors.background.withOpacity(.8),
            800: AppColors.background.withOpacity(.9),
            900: AppColors.background.withOpacity(1),
          },
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.transparent,
          elevation: 0,
          titleSpacing: 0,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: AppColors.background,
        ),
      ),
    );
  }
}
