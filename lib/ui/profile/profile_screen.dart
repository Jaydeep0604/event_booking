import 'dart:math';

import 'package:event_booking/model/globle_model.dart';
import 'package:event_booking/model/interest_model.dart';
import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/ui/animations/fade_widget.dart';
import 'package:event_booking/ui/animations/grid_list_anim.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/ui/globle/globle_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/utils/route_transition.dart';
import 'package:event_booking/widget/appbar/appbars.dart';
import 'package:event_booking/widget/appbar/common_appbar_content.dart';
import 'package:event_booking/widget/globle_list_widget.dart';
import 'package:event_booking/widget/interest_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const profileScreen = 'profilescreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> choices = [
    'Games Online',
    'Concert',
    'Music',
    'Art',
    'Movie',
    'Others'
  ];

  List<InterestModel> interestList = [
    InterestModel("Games"),
    InterestModel("Concert"),
    InterestModel("Music"),
    InterestModel("Art"),
    InterestModel("Movie"),
    InterestModel("Others"),
  ];
  List<GlobleModel> globleList = [
    GlobleModel("1", "assets/images/Mask Group.png", "Shirley H.", true),
    GlobleModel(
        "2", "assets/images/Women's Leadership.png", "Sue T. Porter", true),
    GlobleModel("3", "assets/images/profile_cover.png", "Kenneth W.", true),
    GlobleModel("4", "assets/images/img1.png", "Clifford N.", true)
  ];
  late Color _color;
  @override
  void initState() {
    super.initState();
    _color = randomColor();
  }

  Color randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  bool TapGloble = false;
  globle() {
    setState(() {
      TapGloble = !TapGloble;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.eventbg,
        appBar: CustomAppBar(
          context: context,
          child: CustomEventContent(
            isNeedCenterTitle: "Profile",
            isNeedLeading: false,
            isNeedProfile: false,
          ),
        ),
        body: ScrollConfiguration(
          behavior: NoGlow(),
          child: SingleChildScrollView(
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
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
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 154,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/edit_profile.svg'),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.primaryColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          globle();
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.saveBgColor,
                              border: Border.all(color: AppColors.primaryColor)),
                          child: Icon(
                            Icons.people_alt_sharp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  if (TapGloble == true && globleList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 22),
                      child: Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: globleList.length,
                          itemBuilder: (context, index) {
                            return HorizontalAnim(
                              index: index,
                              child: Stack(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GlobleScreen()));
                                      },
                                      child: GlobleListWidget(
                                          globleModel: globleList[index])),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 110),
                                    child: IconButton(
                                        key: UniqueKey(),
                                        onPressed: () {
                                          setState(() {
                                            globleList.removeAt(index);
                                          });
                                        },
                                        icon: Icon(Icons.close)),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 5,
                            );
                          },
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'About Me',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: HorizontalAnim(
                            index: 1,
                            child: Text(
                              'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Interest',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              height: 28,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.saveBgColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/images/edit.svg'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'CHANGE',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GridView.count(
                            primary: false,
                            shrinkWrap: true,
                            childAspectRatio: 2,
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: List.generate(interestList.length, (index) {
                              return GrideListAnim(
                                index: index,
                                child: InterestWidget(
                                    interestModel: interestList[index]),
                              );
                            })),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
