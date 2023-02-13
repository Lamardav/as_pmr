import 'package:as_pmr/common/theme/colors.dart';
import 'package:as_pmr/navigation/app_routes.dart';
import 'package:flutter/material.dart';

import 'precached_images.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<StatefulWidget> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _index = 0;
  late List<Widget> _tabsWidgets;

  @override
  void initState() {
    final appRoutes = AppRoutes.appRoutesMap;
    _tabsWidgets = [
      appRoutes[AppRoutes.main]!,
      appRoutes[AppRoutes.main]!,
      appRoutes[AppRoutes.main]!,
      appRoutes[AppRoutes.main]!,
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImages(context);
    super.didChangeDependencies();
  }

  List<BottomNavigationBarItem> _getTabBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/Home.png'),
        activeIcon: Image.asset('assets/icons/Home_Active.png'),
        label: 'Главный',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/Tax.png'),
        activeIcon: Image.asset('assets/icons/Tax_Active.png'),
        label: 'Проездные',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/Help.png'),
        activeIcon: Image.asset('assets/icons/Help_Active.png'),
        label: 'Помощь',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/Profile.png'),
        activeIcon: Image.asset('assets/icons/Profile_Active.png'),
        label: 'Профиль',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabsWidgets[_index],
      backgroundColor: AppColors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.transparent,
          selectedItemColor: AppColors.azure,
          unselectedItemColor: AppColors.tertiary,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          elevation: 0,
          items: _getTabBarItems(),
          onTap: (idx) => setState(() {
            _index = idx;
          }),
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
        ),
      ),
    );
  }
}
