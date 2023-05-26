import 'package:flutter/material.dart';

enum MyTabItem { explore, event, add, map, profile }
const Map<MyTabItem, String> tabName = {
  MyTabItem.explore: 'explore',
  MyTabItem.event: 'event',
  MyTabItem.add: 'add',
  MyTabItem.map: 'map',
  MyTabItem.profile: 'profile'
};
final navigatorKeys = {
  MyTabItem.explore: GlobalKey<NavigatorState>(debugLabel: 'explore'),
  MyTabItem.event: GlobalKey<NavigatorState>(debugLabel: 'event'),
  MyTabItem.add: GlobalKey<NavigatorState>(debugLabel: 'add'),
  MyTabItem.map: GlobalKey<NavigatorState>(debugLabel: 'map'),
  MyTabItem.profile: GlobalKey<NavigatorState>(debugLabel: 'profile')
};
final globalNavigatorKey = GlobalKey<NavigatorState>();
