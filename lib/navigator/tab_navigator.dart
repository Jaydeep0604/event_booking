import 'package:event_booking/navigator/route.dart';
import 'package:event_booking/navigator/tab_item.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  // static const String root = '/';
  // static const String detail = '/detail';
  // static const String detail1 = '/detail1';
  // static const String detail2 = '/detail2';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final MyTabItem tabItem;
  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => EBRoute.genrateRoute(context, tabItem.index,
                  routeSettings)[routeSettings.name]!(context),
              settings: routeSettings);
        });
  }
}
