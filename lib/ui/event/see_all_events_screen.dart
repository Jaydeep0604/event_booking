import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/ui/base/base.dart';
import 'package:event_booking/ui/event/event_details_screen.dart';
import 'package:event_booking/ui/event/event_screen.dart';
import 'package:event_booking/utils/EBToast.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/utils/route_transition.dart';
import 'package:event_booking/widget/appbar/appbars.dart';
import 'package:event_booking/widget/appbar/common_appbar_content.dart';
import 'package:event_booking/widget/map_locations_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeeAllEventScreen extends StatefulWidget {
  const SeeAllEventScreen({Key? key}) : super(key: key);
  static const seeAllEventScreen = "/SeeAllEventScreen";

  @override
  State<SeeAllEventScreen> createState() => _SeeAllEventScreenState();
}

class _SeeAllEventScreenState extends State<SeeAllEventScreen> {
  bool upcoming = true;
  bool pastevent = false;
  List<EventModel> pasteventList = [
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
  ];
  List<EventModel> upcomingeventList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        child: CustomAppSearchContent(
          isNeedCenterTitle: "Events",
          isNeedLeading: true,
          isNeedProfile: true,
          action: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                      navigatorKeys[Base.getCurrentTab(context)]
                          ?.currentState
                          ?.pushNamed(EventScreen.eventScreen);
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 52,
          right: 52,
        ),
        child: Container(
            height: 48,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: () {
                EbToast.instance.showErrorMessage(context, "Not developed");
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>EventScreen()));
                // Navigator.pushNamed(
                //   context,
                //   EventScreen.eventScreen,
                // );
                navigatorKeys[Base.getCurrentTab(context)]
                    ?.currentState
                    ?.pushNamed(
                      EventScreen.eventScreen,
                    );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Text('Explore Events ',
                        style: Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset("assets/icons/right.svg"))
                ],
              ),
            )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.saveBgColor),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          upcoming = true;
                          pastevent = false;
                        });
                      },
                      child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: upcoming
                                  ? AppColors.whiteColor
                                  : AppColors.saveBgColor),
                          child: Center(
                              child: Text(
                            "UPCOMING",
                            style: TextStyle(
                                fontSize: 15,
                                color: upcoming
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor),
                          ))),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          upcoming = false;
                          pastevent = true;
                        });
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: pastevent
                                ? AppColors.whiteColor
                                : AppColors.saveBgColor),
                        child: Center(
                            child: Text(
                          "PAST EVENT",
                          style: TextStyle(
                              fontSize: 15,
                              color: pastevent
                                  ? AppColors.primaryColor
                                  : AppColors.blackColor),
                        )),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              if (pastevent == true && pasteventList.length > 0)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScrollConfiguration(
                    behavior: NoGlow(),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: pasteventList.length,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return VerticalAnim(
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
                              child: MapLocationsWidget(
                                  eventModel: pasteventList[index])),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox();
                      },
                    ),
                  ),
                ),
              // if (upcoming == true && upcomingeventList.length > 0)
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ListView.separated(
              //       scrollDirection: Axis.vertical,
              //       itemCount: upcomingeventList.length,
              //       shrinkWrap: true,
              //       primary: false,
              //       itemBuilder: (context, index) {
              //         return GestureDetector(
              //             onTap: () {
              //               globalNavigatorKey.currentState?.push(
              //                   SlideRightRoute(
              //                       page: EventDetailsScreen(),
              //                       settings: RouteSettings(
              //                           name: EventDetailsScreen
              //                               .eventDetailsScreen)));
              //             },
              //             child: MapLocationsWidget(
              //                 eventModel: upcomingeventList[index]));
              //       },
              //       separatorBuilder: (BuildContext context, int index) {
              //         return SizedBox();
              //       },
              //     ),
              //   ),
              if (upcoming == true)
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/images/noEvent.svg"),
                        SizedBox(
                          height: 31,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 54, right: 54),
                          child: Column(
                            children: [
                              Text(
                                "No Upcoming Event",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ))
        ],
      )),
    );
  }
}
