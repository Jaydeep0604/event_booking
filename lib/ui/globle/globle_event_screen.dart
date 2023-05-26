import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/ui/event/event_details_screen.dart';
import 'package:event_booking/utils/route_transition.dart';
import 'package:event_booking/widget/map_locations_widget.dart';
import 'package:flutter/material.dart';

class GlobleEventScreen extends StatefulWidget {
  const GlobleEventScreen({Key? key}) : super(key: key);

  @override
  State<GlobleEventScreen> createState() => _GlobleEventScreenState();
}

class _GlobleEventScreenState extends State<GlobleEventScreen> {
  final controller = ScrollController();
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14,right: 14,top: 24),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: eventList.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                globalNavigatorKey.currentState?.push(SlideRightRoute(
                    page: EventDetailsScreen(),
                    settings: RouteSettings(
                        name: EventDetailsScreen.eventDetailsScreen)));
              },
              child: VerticalAnim(
                index: index,
                child: MapLocationsWidget(eventModel: eventList[index])));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox();
        },
      ),
    );
  }
}
