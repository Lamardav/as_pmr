import 'package:as_pmr/common/theme/colors.dart';
import 'package:as_pmr/navigation/app_routes.dart';
import 'package:as_pmr/navigation/tabs/widgets/BottomIcon.dart';
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
        icon: BottomIcon(srcPath: 'assets/icons/bottom_field.png'),
        activeIcon:
            BottomIcon(srcPath: 'assets/icons/bottom_fields_active.png'),
        label: 'Поля',
      ),
      BottomNavigationBarItem(
        icon: BottomIcon(srcPath: 'assets/icons/bottom_meteo.png'),
        activeIcon: BottomIcon(srcPath: 'assets/icons/bottom_meteo_active.png'),
        label: 'Метеоанализ',
      ),
      BottomNavigationBarItem(
        icon: BottomIcon(srcPath: 'assets/icons/bottom_works.png'),
        activeIcon: BottomIcon(srcPath: 'assets/icons/bottom_works_active.png'),
        label: 'Работы',
      ),
      BottomNavigationBarItem(
        icon: BottomIcon(srcPath: 'assets/icons/bottom_notes.png'),
        activeIcon: BottomIcon(srcPath: 'assets/icons/bottom_notes_active.png'),
        label: 'Заметки',
      ),
      BottomNavigationBarItem(
        icon: BottomIcon(srcPath: 'assets/icons/bottom_profile.png'),
        activeIcon:
            BottomIcon(srcPath: 'assets/icons/bottom_profile_active.png'),
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
        decoration: const BoxDecoration(
          color: AppColors.black,
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.transparent,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.black,
          selectedFontSize: 11,
          items: _getTabBarItems(),
          onTap: (idx) => setState(() {
            _index = idx;
          }),
          elevation: 0,
          unselectedFontSize: 11,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          enableFeedback: false,
          selectedLabelStyle: const TextStyle(color: AppColors.viridian),
        ),
      ),
    );
  }
}
