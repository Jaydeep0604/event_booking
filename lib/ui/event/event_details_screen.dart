import 'package:event_booking/model/invite_friend_model.dart';
import 'package:event_booking/ui/animations/grid_list_anim.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/ui/base/base.dart';
import 'package:event_booking/utils/EBToast.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/widget/EB_EditText_widget.dart';
import 'package:event_booking/widget/appbar/appbars.dart';
import 'package:event_booking/widget/appbar/common_appbar_content.dart';
import 'package:event_booking/widget/invite_friend_widget.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);
  static const eventDetailsScreen = "eventdetailsscreen";

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  bool follow = true;
  static int _len = 12;
  List<bool> isChecked = List.generate(_len, (index) => false);
  final controller = ScrollController();
  following() {
    setState(() {
      follow = !follow;
    });
  }

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
  bool save = false;
  void saved() {
    setState(() {
      save = !save;
      if(save)
        EbToast.instance.simpleMessage(context, "Event saved successfully");
      if(!save)
        EbToast.instance.simpleMessage(context, "Event removed successfully");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.artColor,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        context: context,
        child: CustomAppContent(
          isNeedCenterTitle: "Event Details",
          isNeedLeading: true,
          isNeedProfile: true,
          // leadingIcon: GestureDetector(
          //   onTap: () {
          //     Drawer();
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20),
          //     child: SvgPicture.asset(
          //       "assets/icons/menu.svg",
          //       width: 20,
          //     ),
          //   ),
          // ),
          action: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: saved,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Transform.scale(
                        scale: 1,
                        child: save
                            ? SvgPicture.asset(
                                "assets/icons/save.svg",
                              )
                            : SvgPicture.asset(
                                "assets/icons/unSave.svg",
                              )),
                  ),
                ),
              )),
        ),
      ),
      extendBody: true,
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
                EbToast.instance
                    .successMessage(context, "Your event booked successfuly");
                Navigator.push(
                    context, MaterialPageRoute(builder: (contex) => Base()));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Text('Buy Ticket \$120',
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
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: NoGlow(),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 244,
                      child: Image.asset(
                        "assets/images/image 77.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 214),
                      child: GrideListAnim(
                        index: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.saveBgColor),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Container(
                                  width: 70,
                                  height: 60,
                                  child: Stack(children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          height: 34,
                                          width: 34,
                                          child: Image.asset(
                                              "assets/images/Oval1.png")),
                                    ),
                                    Center(
                                      child: Container(
                                          height: 34,
                                          width: 34,
                                          child: Image.asset(
                                              "assets/images/Oval2.png")),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                          height: 34,
                                          width: 34,
                                          child: Image.asset(
                                              "assets/images/Oval3.png")),
                                    )
                                  ]),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "+20 Going",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 15),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 14),
                                  child: Container(
                                    height: 32,
                                    width: 72,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: TextButton(
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.0)),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter setState) {
                                                return ScrollConfiguration(
                                                    behavior: NoGlow(),
                                                    child: Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                              canvasColor:
                                                                  Colors.white),
                                                      child: Material(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        50.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        50.0)),
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 15,
                                                                  horizontal:
                                                                      0),
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.75,
                                                          child: Column(
                                                            children: [
                                                              // Image.asset(
                                                              //     'assets/bottom-divider.png'),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            23),
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              15),
                                                                  child: Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child:
                                                                          Text(
                                                                        'Invite Friend',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 25),
                                                                      )),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            23),
                                                                child:
                                                                    IntrinsicHeight(
                                                                  child: Row(
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                        "assets/icons/search.svg",
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                      ),
                                                                      VerticalDivider(
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        indent:
                                                                            5,
                                                                        endIndent:
                                                                            5,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            EBESearchText(
                                                                          height:
                                                                              30,
                                                                          hint:
                                                                              "Search...",
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            45,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    ScrollConfiguration(
                                                                  behavior:
                                                                      NoGlow(),
                                                                  child:
                                                                      CustomScrollView(
                                                                    controller:
                                                                        controller,
                                                                    slivers: [
                                                                      SliverFillRemaining(
                                                                        hasScrollBody:
                                                                            false,
                                                                        child:
                                                                            Container(
                                                                          margin:
                                                                              EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                15,
                                                                          ),
                                                                          height:
                                                                              700,
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          child:
                                                                              ListView.separated(
                                                                            primary:
                                                                                false,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                invitefriendList.length,
                                                                            itemBuilder:
                                                                                (context, index) {
                                                                              return VerticalAnim(
                                                                                index: index,
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    setState() {
                                                                                      _len;
                                                                                    }
                                                                                  },
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      InviteFriendWidget(inviteFriendModel: invitefriendList[index]),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(left: 300),
                                                                                        child: Transform.scale(
                                                                                          scale: 1.2,
                                                                                          child: Checkbox(
                                                                                            // fillColor: MaterialStateProperty.resolveWith(getColor),
                                                                                            activeColor: AppColors.primaryColor,
                                                                                            checkColor: Colors.white,
                                                                                            visualDensity: VisualDensity.compact,
                                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                                                                            value: isChecked[index],
                                                                                            onChanged: (value) {
                                                                                              setState(() {
                                                                                                isChecked[index] = value!;
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            separatorBuilder:
                                                                                (BuildContext context, int index) {
                                                                              return SizedBox(
                                                                                height: 10,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  left: 40,
                                                                  right: 40,
                                                                ),
                                                                child:
                                                                    Container(
                                                                        height:
                                                                            48,
                                                                        decoration: BoxDecoration(
                                                                            color: AppColors
                                                                                .primaryColor,
                                                                            borderRadius: BorderRadius.circular(
                                                                                10)),
                                                                        child:
                                                                            TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>EventScreen()));
                                                                            // Navigator.pushNamed(
                                                                            //   context,
                                                                            //   EventScreen.eventScreen,
                                                                            // );
                                                                            // navigatorKeys[
                                                                            //         Base.getCurrentTab(
                                                                            //             context)]
                                                                            //     ?.currentState
                                                                            //     ?.pushNamed(
                                                                            //       EventScreen
                                                                            //           .eventScreen,
                                                                            //     );
                                                                          },
                                                                          child:
                                                                              Stack(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            children: [
                                                                              Center(
                                                                                child: Text('Explore Events ', style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                                                                              ),
                                                                              Align(alignment: Alignment.centerRight, child: SvgPicture.asset("assets/icons/right.svg"))
                                                                            ],
                                                                          ),
                                                                        )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                              });
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Invite",
                                          style: TextStyle(
                                              color: AppColors.whiteColor),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 20, bottom: 18),
                  child: Text(
                    "International Band Music Concert",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: HorizontalAnim(
                    index: 1,
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              color: AppColors.saveBgColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: SvgPicture.asset(
                              "assets/icons/events.svg",
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "14 December, 2021",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "Tuesday, 4:00PM - 9:00PM",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 24),
                  child: HorizontalAnim(
                    index: 1,
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              color: AppColors.saveBgColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: SvgPicture.asset(
                              "assets/icons/map.svg",
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gala Convention Center",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "36 Guild Street London, UK ",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 24, right: 24),
                  child: HorizontalAnim(
                    index: 1,
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              color: AppColors.saveBgColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            "assets/icons/Image.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ashfak Sayem",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "Organizer",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )),
                        GestureDetector(
                          onTap: () {
                            following();
                          },
                          child: Container(
                            width: follow ? 60 : 80,
                            height: 28,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: follow
                                    ? AppColors.saveBgColor
                                    : AppColors.primaryColor),
                            child: Center(
                                child: Text(
                              follow ? "Follow" : "Following",
                              style: TextStyle(
                                  color: follow
                                      ? AppColors.primaryColor
                                      : AppColors.whiteColor),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 21),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About Event",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 21, right: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: VerticalAnim(
                        index: 1,
                        child: ExpandableText(
                          "Enjoy your favorite dishe and a lovely your friends and familyEnjoy your favorite dishe and a loEnjoy your favorite dishe and a lovely your friends and familyvely your friends and family and have a great time. Food from local food trucks will be available for purchase.",
                          expandText: "Read More...",
                          collapseText: 'show less',
                          linkColor: AppColors.primaryColor,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 140,
                )
              ],
            )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 141,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/smoke.png",
                    fit: BoxFit.cover,
                  )))
        ],
      ),
    );
  }
}
