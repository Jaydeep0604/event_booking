import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  MyTabItem currentTab;
  final ValueChanged<MyTabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BottomNavPaint(),
      child: Container(
        height: Platform.isIOS
            ? kBottomNavigationBarHeight + 50
            : kBottomNavigationBarHeight + 31,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded( 
              flex: 1,
              child: InkWell(
                onTap: () {
                  onSelectTab(
                    MyTabItem.values[0],
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == MyTabItem.explore
                            ? SvgPicture.asset(
                                "assets/icons/explore.svg",
                                width: 25,height: 25,
                                color: AppColors.primaryColor,
                              )
                            : SvgPicture.asset(
                                "assets/icons/explore.svg",
                                width: 25,height: 25,
                                color: AppColors.baseInactiveColor,
                              ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Explore",
                          style: TextStyle(fontSize: 12),
                        )
                      ]),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  onSelectTab(
                    MyTabItem.values[1],
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == MyTabItem.event
                            ? SvgPicture.asset(
                                "assets/icons/events.svg",
                                width: 25,height: 25,
                                color: AppColors.primaryColor,
                              )
                            : SvgPicture.asset(
                                "assets/icons/events.svg",
                                width: 25,height: 25,
                                color: AppColors.baseInactiveColor,
                              ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Event",
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ]),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onSelectTab(
                  MyTabItem.values[2],
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTab == MyTabItem.add
                          ? SvgPicture.asset(
                              "assets/icons/add.svg",
                              width: 25,
                              height: 25,
                              color: AppColors.primaryColor,
                            )
                          : SvgPicture.asset(
                              "assets/icons/add.svg",
                              width: 25,height: 25,
                              color: AppColors.baseInactiveColor,
                            ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Add",
                        style: TextStyle(fontSize: 12),
                      )
                    ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  onSelectTab(
                    MyTabItem.values[3],
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == MyTabItem.map
                            ? SvgPicture.asset(
                                "assets/icons/map.svg",
                                width: 25,
                                height: 25,
                                color: AppColors.primaryColor,
                              )
                            : SvgPicture.asset(
                                "assets/icons/map.svg",
                                width: 25,
                                height: 25,
                                color: AppColors.baseInactiveColor,
                              ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Map",
                          style: TextStyle(fontSize: 12),
                        )
                      ]),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  onSelectTab(
                    MyTabItem.values[4],
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == MyTabItem.profile
                            ? SvgPicture.asset(
                                "assets/icons/profile.svg",
                                width: 25,
                                height: 25,
                                color: AppColors.primaryColor,
                              )
                            : SvgPicture.asset(
                                "assets/icons/profile.svg",
                                width: 25,
                                height: 25,
                                color: AppColors.baseInactiveColor,
                              ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(fontSize: 12),
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    Path path = Path();
    double depth = 30;
    path.moveTo(0, depth);
    path.lineTo(size.width * 0.20, depth);
    path.quadraticBezierTo(size.width * 0.35, depth, size.width * 0.37, 22);
    path.cubicTo(
        size.width * 0.45, -8, size.width * 0.55, -8, size.width * 0.65, 22);
    path.quadraticBezierTo(size.width * 0.72, depth, size.width * 0.80, depth);
    path.lineTo(size.width * 0.0, depth);
    path.lineTo(size.width, depth);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 20, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// class BottomNavWaveClip extends CustomClipper<Path> {
//   @override
//   getClip(Size size) {
//     Path path = Path();
//     double depth = 30;
//     path.moveTo(0, depth);
//     path.lineTo(size.width * 0.20, depth);
//     path.quadraticBezierTo(size.width * 0.35, depth, size.width * 0.37, 22);
//     path.cubicTo(
//         size.width * 0.45, -8, size.width * 0.55, -8, size.width * 0.63, 22);
//     path.quadraticBezierTo(size.width * 0.63, depth, size.width * 0.90, depth);
//     path.lineTo(size.width * 0.80, depth);
//     path.lineTo(size.width, depth);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper oldClipper) {
//     return true;
//   }
// }

// class NotchedRoundedCornerShape extends ShapeBorder {
//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     Path path = Path();
//     double depth = 40;
//     final size = rect.size;
//     path.moveTo(0, depth);
//     path.lineTo(size.width * 0.20, depth);
//     path.quadraticBezierTo(size.width * 0.35, depth, size.width * 0.37, 32);
//     path.cubicTo(
//         size.width * 0.45, 0, size.width * 0.55, 0, size.width * 0.63, 32);
//     path.quadraticBezierTo(size.width * 0.63, depth, size.width * 0.90, depth);
//     path.lineTo(size.width * 0.80, depth);
//     path.lineTo(size.width, depth);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);

//     return path;
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     return getInnerPath(rect, textDirection: textDirection);
//   }

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
//     canvas.drawColor(Colors.white, BlendMode.color);
//     canvas.drawPaint(BorderSide.none.toPaint());
//   }

//   @override
//   ShapeBorder scale(double t) {
//     return NotchedRoundedCornerShape();
//   }
// }
