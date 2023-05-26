import 'package:event_booking/navigator/route.dart';
import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/ui/splash/splash_screen.dart';
import 'package:event_booking/utils/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
          return themeChangeProvider;
        },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) {
        return MaterialApp(
          navigatorKey: globalNavigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: SplashScreen(),
          onGenerateRoute: EBRoute.generateGlobleRoute
         );
        }
      ),
    );
  }
}
