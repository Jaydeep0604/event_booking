import 'package:event_booking/ui/add/add_screen.dart';
import 'package:event_booking/ui/event/event_screen.dart';
import 'package:event_booking/ui/explore/explore_screen.dart';
import 'package:event_booking/ui/map/map_screen.dart';
import 'package:event_booking/ui/profile/profile_screen.dart';
import 'package:event_booking/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class EBRoute {
  static Map<String, WidgetBuilder> genrateRoute(
      BuildContext context, int index, RouteSettings settings) {
    Map<int, Widget> routeName = {
      0: ExploreScreen(),
      1: EventScreen(),
      2: AddScreen(),
      3: MapScreen(),
      4: ProfileScreen()
    };
    return {
      ExploreScreen.exploreScreen: (context) => routeName[index]!,
      EventScreen.eventScreen: (context) => routeName[index]!,
      AddScreen.addScreen: (context) => routeName[index]!,
      MapScreen.mapScreen: (context) => routeName[index]!,
      ProfileScreen.profileScreen: (context) => routeName[index]!
    };
  }

  static Route<dynamic> generateGlobleRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.splashScreen:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(), settings: settings);
        case EventScreen.eventScreen:
        return MaterialPageRoute(
            builder: (context) => EventScreen(), settings: settings);
      // case GlobleScreen.globleScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => EventScreen(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text("No route defined for ${settings.name}")),
                ));
    }
  }
}
