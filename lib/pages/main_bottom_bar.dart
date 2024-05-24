import 'package:auth_flutter_with_firebase/helpers/Const.dart';
import 'package:auth_flutter_with_firebase/pages/bottom_bar/bottom_bar.dart';
import 'package:auth_flutter_with_firebase/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PersistentTabConfig> listTab = [
      PersistentTabConfig(
        screen: const HomeView(),
        item: ItemConfig(
            icon: Image.asset(AppImage.iconHomeActive),
            title: "Home",
            inactiveIcon: Image.asset(AppImage.iconHomeInactive),
            activeForegroundColor: AppColors.black),
      ),
      PersistentTabConfig(
        screen: const HomeView(),
        item: ItemConfig(
            icon: Image.asset(AppImage.iconProfileActive),
            inactiveIcon: Image.asset(AppImage.iconProfileInactive),
            title: "Profile",
            activeForegroundColor: AppColors.black),
      ),
      PersistentTabConfig(
        screen: const HomeView(),
        item: ItemConfig(
            icon: Image.asset(AppImage.iconCartActive),
            inactiveIcon: Image.asset(AppImage.iconCartInactive),
            title: "Cart",
            activeForegroundColor: AppColors.black),
      ),
      PersistentTabConfig(
        screen: const HomeView(),
        item: ItemConfig(
            icon: Image.asset(AppImage.iconChatActive),
            inactiveIcon: Image.asset(AppImage.iconChatInActive),
            title: "Chat",
            activeForegroundColor: AppColors.black),
      ),
    ];
    return PersistentTabView(
      tabs: listTab,
      margin: const EdgeInsets.only(right: 10, bottom: 1, left: 10),
      navBarHeight: 74,
      navBarBuilder: (navBarConfig) => BottomBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: const BorderRadius.all(Radius.circular(13))),
      ),
    );
  }
}
