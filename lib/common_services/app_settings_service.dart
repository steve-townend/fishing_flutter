import 'package:flutter/material.dart';

class AppSettingsService {
  
  final String appName = "Fishing";
  final String author = "Steve Townend";
  final String appUrl = "https//fishing.townend.dev";
  final String appLogo = "images/fisherman-3719443-logo.png";

  // Icon not used at present, prefer appLogo image
  static const IconData iconData = Icons.person_2;
  final Icon appIcon = const Icon(iconData, size: 64);  
  final Icon appIconSmall = const Icon(iconData, size: 32);

  var navigationPages = [
    NavigationRoute("Home", "/home", const Icon(Icons.home_outlined)),
    NavigationRoute("Trips", "/trips", const Icon(Icons.drive_eta_outlined)),
    NavigationRoute("Catches", "/catches", const Icon(Icons.set_meal_outlined)),
    NavigationRoute("Log", "/log", const Icon(Icons.fact_check_outlined)),
    NavigationRoute("Search", "/search", const Icon(Icons.search_outlined)),
    NavigationRoute("My Sites", "/mySites", const Icon(Icons.star_outline)),
  ];

  int getRouteIndexByUiName(String nameToFind) {

    int routeIndex = 0;
    
    for (var index = 0; index < navigationPages.length; index++) {
      if (navigationPages[index].uiName.toLowerCase() == nameToFind.toLowerCase()) {
        routeIndex = index;
      }
    }

    return routeIndex;
  }

  NavigationRoute getRouteByIndex(int index) {

    return navigationPages[index];
  }

  List<BottomNavigationBarItem> getNavigationBarItems() {

    List<BottomNavigationBarItem> items = [];

    for (var page in navigationPages) {
      items.add(
        BottomNavigationBarItem(
          icon: page.icon,
          label: page.uiName,
        )
      );
    }

    return items;
  }
}

class NavigationRoute {
  String uiName;
  String routeName;
  Icon icon;

  NavigationRoute(this.uiName, this.routeName, this.icon);
}