import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/model/invite_friend_model.dart';
import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/ui/animations/grid_list_anim.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/ui/base/base.dart';
import 'package:event_booking/ui/event/event_details_screen.dart';
import 'package:event_booking/ui/event/see_all_events_screen.dart';
import 'package:event_booking/ui/notification/notification_screen.dart';
import 'package:event_booking/ui/search/search_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/utils/route_transition.dart';
import 'package:event_booking/widget/EB_EditText_widget.dart';
import 'package:event_booking/widget/appbar/appbars.dart';
import 'package:event_booking/widget/appbar/common_appbar_content.dart';
import 'package:event_booking/widget/evet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_share/flutter_share.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const exploreScreen = '/';

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<EventModel> eventList = [
    // EventModel("id", "date", true, "title", "total_going", "address"),
    EventModel(
        "1",
        "assets/images/event1.png",
        "10 JUNE",
        true,
        "International Band Mu...",
        "20",
        "36 Guild Street London, UK ",
        "assets/images/Oval1.png",
        "assets/images/Oval2.png",
        "assets/images/Oval3.png"),
    EventModel(
        "2",
        "assets/images/event2.png",
        "10 June",
        true,
        "Jo Malone London’s Mo..",
        "20",
        "Radius Gallery • Santa Cruz, CA",
        "assets/images/Oval1.png",
        "assets/images/Oval2.png",
        "assets/images/Oval3.png"),
  ];
  List<InviteFriendModel> invitefriendList = [
    InviteFriendModel(
        "1", "assets/images/event2.png", "Alex Lee", "2k Follwers"),
    InviteFriendModel(
        "2", "assets/images/event2.png", "Micheal Ulasi", "56 Follwers"),
    InviteFriendModel(
        "3", "assets/images/event2.png", "Cristofer", "300 Follwers"),
    InviteFriendModel(
        "4", "assets/images/event2.png", "David  Silbia", "5k Follwers"),
    InviteFriendModel(
        "5", "assets/images/event2.png", "Ashfak Sayem", "402 Follwers"),
    InviteFriendModel(
        "6", "assets/images/event2.png", "Rocks Velkeinjen ", "893 Follwers"),
    InviteFriendModel(
        "7", "assets/images/event2.png", "Alex Lee", "2k Follwers"),
    InviteFriendModel(
        "8", "assets/images/event2.png", "Micheal Ulasi", "56 Follwers"),
    InviteFriendModel(
        "9", "assets/images/event2.png", "Cristofer", "300 Follwers"),
    InviteFriendModel(
        "10", "assets/images/event2.png", "David  Silbia", "5k Follwers"),
    InviteFriendModel(
        "11", "assets/images/event2.png", "Ashfak Sayem", "402 Follwers"),
    InviteFriendModel(
        "12", "assets/images/event2.png", "Rocks Velkeinjen ", "893 Follwers"),
  ];
  String text = '';
  String link = '';
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarWithBgColor(
        context: context,
        child: HomeCustomAppContent(
          isNeedCenterTitle: true,
          isNeedLeading: false,
          isNeedProfile: true,
          leadingIcon: GestureDetector(
            onTap: () {
              Base.openDrawer(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SvgPicture.asset(
                "assets/icons/menu.svg",
                width: 20,
              ),
            ),  
          ),
          action: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  // Navigator.pushNamed(
                  //     context, NotificationPage.notificationPageUrl);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
                child: SvgPicture.asset(
                  "assets/icons/notification.svg",
                  width: 30,
                  height: 30,
                ),
              )),
        ),
      ),
      drawer: Drawer(),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 176,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )),
                  ),
                  Container(
                    height: 196,
                    // color: AppColors.primaryColor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 90,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/search.svg"),
                                VerticalDivider(
                                  color: AppColors.whiteColor,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchScreen()));
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: EBESearchText(
                                            enabled: false,
                                            height: 30,
                                            hint: "Search...",
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        SvgPicture.asset(
                                            "assets/icons/filtors.svg"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        HorizontalAnim(
                          index: 1,
                          child: Container(
                            height: 40,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(
                                  width: 24,
                                ),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: AppColors.sportColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/sports.svg",
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Sports"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: AppColors.musicColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/music.svg",
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Music"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: AppColors.foodColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/food.svg",
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Food"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: AppColors.artColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/art.svg",
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Art"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
                SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    children: [
                      Text(
                        "Upcoming Events",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SeeAllEventScreen()));
                            globalNavigatorKey.currentState?.push(SlideRightRoute(
                                page: SeeAllEventScreen(),
                                settings: RouteSettings(
                                    name: SeeAllEventScreen.seeAllEventScreen)));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "See All",
                                style: TextStyle(fontSize: 14),
                              ),
                              Icon(
                                Icons.arrow_right_sharp,
                                color: AppColors.saveBgColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 22),
                child: Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    // physics: AlwaysScrollableScrollPhysics(
                    // ),
                    scrollDirection: Axis.horizontal,
                    itemCount: eventList.length,
                    itemBuilder: (context, index) {
                      return HorizontalAnim(
                        index: index,
                        child: GestureDetector(
                            onTap: () {
                              globalNavigatorKey.currentState?.push(
                                  SlideRightRoute(
                                      page: EventDetailsScreen(),
                                      settings: RouteSettings(
                                          name: EventDetailsScreen
                                              .eventDetailsScreen)));
                            },
                            child: EventWidget(eventModel: eventList[index])),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: GrideListAnim(
                  index: 1,
                  child: Container(
                    height: 127,
                    decoration: BoxDecoration(
                        color: AppColors.inviteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 18,
                              top: 13,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Invite your friends",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Get \$20 for ticket"),
                                SizedBox(
                                  height: 13,
                                ),
                                Container(
                                  height: 32,
                                  width: 72,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            AppColors.inviteBtnColor,
                                      ),
                                      onPressed: () {
                                        share();
                                      },
                                      child: Text(
                                        "Invite",
                                        style: TextStyle(
                                            color: AppColors.whiteColor),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 140,
                              ),
                              child: Container(
                                child: Image.asset(
                                  "assets/images/invite.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: [
                    Text(
                      "Nearby You",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          globalNavigatorKey.currentState?.push(SlideRightRoute(
                              page: SeeAllEventScreen(),
                              settings: RouteSettings(
                                  name: SeeAllEventScreen.seeAllEventScreen)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(
                              Icons.arrow_right_sharp,
                              color: AppColors.saveBgColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 22),
                child: Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    // physics: AlwaysScrollableScrollPhysics(
                    // ),
                    scrollDirection: Axis.horizontal,
                    itemCount: eventList.length,
                    itemBuilder: (context, index) {
                      return HorizontalAnim(
                        index: index,
                        child: GestureDetector(
                            onTap: () {
                              globalNavigatorKey.currentState?.push(
                                  SlideRightRoute(
                                      page: EventDetailsScreen(),
                                      settings: RouteSettings(
                                          name: EventDetailsScreen
                                              .eventDetailsScreen)));
                            },
                            child: EventWidget(eventModel: eventList[index])),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
      title: 'Event Booking',
      text:
          'Event Booking,\n\nKeep the kids happy this summer with free entry to the Paintball Centre throughout the whole of August. Call or text to book a date at 555-774-344 and receive a \$20 voucher. PaintMania',
      // linkUrl: 'https://flutter.dev/',
    );
  }
}
