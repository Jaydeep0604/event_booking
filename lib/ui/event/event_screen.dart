import 'dart:math';

import 'package:auto_animated/auto_animated.dart';
import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/model/interest_model.dart';
import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/ui/animations/fade_widget.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/ui/event/event_details_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/utils/route_transition.dart';
import 'package:event_booking/widget/appbar/appbars.dart';
import 'package:event_booking/widget/appbar/common_appbar_content.dart';
import 'package:event_booking/widget/map_locations_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);
  static const eventScreen = 'eventscreen';

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<EventModel> eventList = [
    // EventModel("id", "date", true, "title", "total_going", "address"),
    EventModel(
        "1",
        "assets/images/jazz.png",
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
    EventModel(
        "1",
        "assets/images/Women's Leadership.png",
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
        "assets/images/Mask Group.png",
        "10 June",
        true,
        "Jo Malone London’s Mo..",
        "20",
        "Radius Gallery • Santa Cruz, CA",
        "assets/images/Oval1.png",
        "assets/images/Oval2.png",
        "assets/images/Oval3.png"),
    EventModel(
        "1",
        "assets/images/Gala Music Festival.png",
        "10 JUNE",
        true,
        "International Band Mu...",
        "20",
        "36 Guild Street London, UK ",
        "assets/images/Oval1.png",
        "assets/images/Oval2.png",
        "assets/images/Oval3.png"),
  ];
  List<InterestModel> eventTypeList = [
    InterestModel("Conferences"),
    InterestModel("Trade"),
    InterestModel("Seminars"),
    InterestModel("Corporate"),
    InterestModel("Company parties"),
    InterestModel("Product launch"),
    InterestModel("Sporting"),
    InterestModel("Foodservice"),
    InterestModel("Exhibitions"),
    InterestModel("Charity"),
    InterestModel("Fashion"),
    InterestModel("Festivals"),
  ];
  // final _listItems = List.generate(200, (i) => "Item $i");

  // Used to generate random integers
  final _random = Random();

  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        context: context,
        child: CustomEventContent(
          isNeedCenterTitle: "Events",
          isNeedLeading: false,
          isNeedProfile: true,
          action: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //     context, NotificationPage.notificationPageUrl);
                },
                child: SvgPicture.asset(
                  "assets/icons/More.svg",
                  color: AppColors.blackColor,
                  width: 25,
                  height: 25,
                ),
              )),
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Type's",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 14, bottom: 14),
              child: Container(
                height: 170,
                child: LiveGrid.options(
                    scrollDirection: Axis.horizontal,
                    itemCount: eventTypeList.length,
                    options: grideAnimOptions,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 10,
                      maxCrossAxisExtent: 55,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 20,
                    ),
                    itemBuilder: (context, index, animation) {
                      return buildAnimatedItem(
                        context,
                        index,
                        animation,
                        Container(
                          // height: 30,
                          // width: 60,
                          decoration: BoxDecoration(
                              color: Colors.primaries[
                                      _random.nextInt(Colors.primaries.length)]
                                  [_random.nextInt(9) * 100]?.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.blackColor)),
                          child: Center(
                            child: Text(
                              "${eventTypeList[index].interest}",
                              style: (TextStyle(fontSize: 13)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Upcoming",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: eventList.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return HorizontalAnim(
                    index: index,
                    child: GestureDetector(
                        onTap: () {
                          globalNavigatorKey.currentState?.push(SlideRightRoute(
                              page: EventDetailsScreen(),
                              settings: RouteSettings(
                                  name: EventDetailsScreen.eventDetailsScreen)));
                        },
                        child: MapLocationsWidget(eventModel: eventList[index])),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox();
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}

const grideAnimOptions = LiveOptions(
  delay: Duration(milliseconds: 50),
  showItemInterval: Duration(milliseconds: 120),
  showItemDuration: Duration(milliseconds: 100),
  visibleFraction: 0.05,
  reAnimateOnVisibility: false,
);
