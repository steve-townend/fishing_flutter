// ignore_for_file: no_leading_underscores_for_local_identifiers

/*
  SMT: 
    This may be useful if I never need to navigate without a context
    If I need to use it then the following should be added to main.dart
    just after the line "return MaterialApp("

    navigatorKey: NavigationService.instance.navigationKey,
*/

/*
import 'package:flutter/material.dart';

class NavigationService{
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static NavigationService instance = NavigationService();

   NavigationService(){
     //navigationKey = GlobalKey<NavigatorState>();
   }

  Future<dynamic> navigateToReplacement(String _rn){
    return navigationKey.currentState!.pushReplacementNamed(_rn);
  }
 
  Future<dynamic> navigateTo(String _rn){
    return navigationKey.currentState!.pushNamed(_rn);
  }
  
  Future<dynamic> navigateToRoute(MaterialPageRoute _rn){
    return navigationKey.currentState!.push(_rn);
   }

  goback(){
    return navigationKey.currentState!.pop();

  }
}

*/