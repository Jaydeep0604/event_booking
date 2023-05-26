import 'package:event_booking/ui/globle/about_screen.dart';
import 'package:event_booking/ui/globle/globle_event_screen.dart';
import 'package:event_booking/ui/globle/reviews_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/widget/appbar/appbars.dart';
import 'package:event_booking/widget/appbar/common_appbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GlobleScreen extends StatefulWidget {
  const GlobleScreen({Key? key}) : super(key: key);
  static const globleScreen = "/globlescreen";

  @override
  State<GlobleScreen> createState() => _GlobleScreenState();
}

class _GlobleScreenState extends State<GlobleScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int tabIndex = 0;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
    controller.addListener(() {
      setState(() {
        tabIndex = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        child: CustomEventContent(
          isNeedCenterTitle: "Profile",
          isNeedLeading: true,
          isNeedProfile: false,
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 92,
              width: 92,
              child: Image.asset(
                'assets/images/profile_cover.png',
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Ashfak Sayem',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )),
          SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '350',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                VerticalDivider(),
                Column(
                  children: [
                    Text(
                      '346',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_alt_1_rounded,
                          color: AppColors.whiteColor,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Follow",
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  width: 17,
                ),
                Expanded(
                    child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/message.svg"),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Massages",
                      ),
                    ],
                  )),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.saveBgColor,
              automaticIndicatorColorAdjustment: true,
              controller: controller,
              indicatorWeight: 4,
              labelStyle: Theme.of(context).textTheme.headline6?.copyWith(),
              tabs: [
                Tab(
                  child: Container(
                    child: Text(
                      "About",
                      style: TextStyle(
                        color: AppColors.baseInactiveColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // text: "Men",
                ),
                Tab(
                  child: Container(
                    child: Text(
                      "Event",
                      style: TextStyle(
                        color: AppColors.baseInactiveColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      "Reviews",
                      style: TextStyle(
                        color: AppColors.baseInactiveColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlow(),
              child: TabBarView(controller: controller, children: [
                AboutScreen(),
                GlobleEventScreen(),
                ReviewsScreen()
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
