import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/ui/intro/intro_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/widget/map_locations_widget.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14,top: 20, right: 20),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: VerticalAnim(
                index: 1,
                child: ExpandableText(
                  "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. ",
                  expandText: "Read More...",
                  collapseText: 'show less',
                  linkColor: AppColors.primaryColor,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
