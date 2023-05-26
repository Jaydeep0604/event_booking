import 'package:event_booking/model/notification_model.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/widget/appbar/appbars.dart';
import 'package:event_booking/widget/appbar/common_appbar_content.dart';
import 'package:event_booking/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> nlist = [
    // NotificationModel("id", "img", "followerName", "invite", "follow", "like", "joinEvent", "timing")
    NotificationModel(
      "1",
      "assets/images/Women's Leadership.png",
      "David Silbia",
      true,
      "Invite Jo Malone London’s Mother’s ",
      false,
      false,
      "",
      "Just now",
    ),
    NotificationModel(
      "1",
      "assets/images/Women's Leadership.png",
      "Marjorie B",
      false,
      "",
      true,
      false,
      "",
      "5 min ago",
    ),
    NotificationModel(
      "1",
      "assets/images/Women's Leadership.png",
      "Cheryl J",
      true,
      "Invite Jo Malone London’s Mother’s ",
      false,
      false,
      "",
      "20 min ago",
    ),
    NotificationModel(
      "1",
      "assets/images/Women's Leadership.png",
      "Craig A",
      false,
      "",
      false,
      true,
      "",
      "1 hour ago",
    ),
    NotificationModel(
      "1",
      "assets/images/Women's Leadership.png",
      "Author",
      false,
      "",
      false,
      true,
      "",
      "3 hour ago",
    ),
    NotificationModel(
      "1",
      "assets/images/Women's Leadership.png",
      "Joyce D",
      false,
      "",
      false,
      false,
      "Join your Event Music Festival",
      "Tue, 5:10 pm",
    ),
    NotificationModel(
      "1",
      "assets/images/Women's Leadership.png",
      "Clara Tate",
      true,
      "Invite Jo Malone London’s Mother’s",
      false,
      false,
      "",
      "wed, 3:30 pm",
    ),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        context: context,
        child: CustomEventContent(
          isNeedCenterTitle: "Notifications",
          isNeedLeading: true,
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
      body: Column(
            children: [
      if(nlist.length<1)
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/bell.svg",
                color: AppColors.saveBgColor,
              ),
              Text(
                "No Notifications!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      Expanded(
        child: ScrollConfiguration(
          behavior: NoGlow(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: nlist.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        // globalNavigatorKey.currentState?.push(SlideRightRoute(
                        //     page: EventDetailsScreen(),
                        //     settings: RouteSettings(
                        //         name: EventDetailsScreen.eventDetailsScreen)));
                      },
                      child: VerticalAnim(
                        index: index,
                        child: NotificationWidget(notificationModel: nlist[index])));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10,);
                },
              ),
            ),
          ),
        ),
      )
            ],
          ),
    );
  }
}
