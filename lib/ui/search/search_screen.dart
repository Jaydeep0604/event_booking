import 'dart:async';
import 'dart:math';
import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/ui/animations/grid_list_anim.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/ui/event/event_details_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/utils/route_transition.dart';
import 'package:event_booking/widget/EB_EditText_widget.dart';
import 'package:event_booking/widget/appbar/appbars.dart';
import 'package:event_booking/widget/appbar/common_appbar_content.dart';
import 'package:event_booking/widget/search_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key, this.latLng, this.title}) : super(key: key);
  LatLng? latLng;
  String? title;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
  String timedate = "first";
  bool sport = true;
  bool music = false;
  bool art = false;
  bool food = false;
  bool dance = false;
  TextEditingController _birthDateCtr = TextEditingController();
  // RangeLabels labels = RangeLabels('10', "150");
  RangeValues values = RangeValues(10, 150);
  RangeValues _currentRangeValues = const RangeValues(10, 150);
  Set<Marker> markers = Set.from([]);
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    if (widget.latLng != null) {
      addMarker(widget.latLng!);
    }
  }

  addMarker(LatLng latLng) {
    markers.add(
      Marker(
        markerId: MarkerId("SELF"),
        position: latLng,
        infoWindow: InfoWindow(title: "${widget.title}"),
      ),
    );
    setState(() {});
  }

  void filterSearchResults(String query) {
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 14, top: 22, right: 14),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            // physics: AlwaysScrollableScrollPhysics(
            // ),
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    globalNavigatorKey.currentState?.push(SlideRightRoute(
                        page: EventDetailsScreen(),
                        settings: RouteSettings(
                            name: EventDetailsScreen.eventDetailsScreen)));
                  },
                  child: SearchItemWidget(eventModel: eventList[index]));
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 15,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          context: context,
          child: CustomAppSearchContent(
            isNeedCenterTitle: "Search",
            isNeedLeading: true,
            isNeedProfile: false,
          ),
        ),
        body: GrideListAnim(
          index: 1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/search.svg",
                        color: AppColors.primaryColor,
                      ),
                      VerticalDivider(
                        color: AppColors.blackColor,
                        indent: 5,
                        endIndent: 5,
                      ),
                      Expanded(
                        child: EBESearchText(
                          height: 30,
                         hint: "Search...",
                        ),
                      ),
                      SizedBox(width: 5,),
            
                      GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context, StateSetter setState) {
                                  return ScrollConfiguration(
                                      behavior: NoGlow(),
                                      child: Theme(
                                        data: Theme.of(context)
                                            .copyWith(canvasColor: Colors.white),
                                        child: Material(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50.0),
                                              topRight: Radius.circular(50.0)),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 0),
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.78,
                                            child: Column(
                                              children: [
                                                // Image.asset(
                                                //     'assets/bottom-divider.png'),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        'Filter',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  height: 97,
                                                  child: HorizontalAnim(
                                                    index: 1,
                                                    child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  sport = !sport;
                                                                });
                                                              },
                                                              child: Align(
                                                                alignment:
                                                                    Alignment.topLeft,
                                                                child: CircleAvatar(
                                                                  radius: 32,
                                                                  backgroundColor: sport
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : Color
                                                                          .fromARGB(
                                                                              255,
                                                                              226,
                                                                              225,
                                                                              225),
                                                                  child: SvgPicture
                                                                      .asset(
                                                                    'assets/icons/sports.svg',
                                                                    color: sport
                                                                        ? Colors.white
                                                                        : AppColors
                                                                            .primaryColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text('Sports',
                                                                style: TextStyle(
                                                                  color: sport
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : AppColors
                                                                          .blackColor,
                                                                )),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  music = !music;
                                                                });
                                                              },
                                                              child: Align(
                                                                alignment:
                                                                    Alignment.topLeft,
                                                                child: CircleAvatar(
                                                                  radius: 32,
                                                                  backgroundColor: music
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : Color
                                                                          .fromARGB(
                                                                              255,
                                                                              226,
                                                                              225,
                                                                              225),
                                                                  child: SvgPicture
                                                                      .asset(
                                                                    'assets/icons/music.svg',
                                                                    color: music
                                                                        ? Colors.white
                                                                        : AppColors
                                                                            .primaryColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text('Music',
                                                                style: TextStyle(
                                                                  color: music
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : AppColors
                                                                          .blackColor,
                                                                )),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  art = !art;
                                                                });
                                                              },
                                                              child: Align(
                                                                alignment:
                                                                    Alignment.topLeft,
                                                                child: CircleAvatar(
                                                                  radius: 32,
                                                                  backgroundColor: art
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : Color
                                                                          .fromARGB(
                                                                              255,
                                                                              226,
                                                                              225,
                                                                              225),
                                                                  child: SvgPicture
                                                                      .asset(
                                                                    'assets/icons/art.svg',
                                                                    color: art
                                                                        ? Colors.white
                                                                        : AppColors
                                                                            .primaryColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text('Art',
                                                                style: TextStyle(
                                                                  color: art
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : AppColors
                                                                          .blackColor,
                                                                )),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  food = !food;
                                                                });
                                                              },
                                                              child: Align(
                                                                alignment:
                                                                    Alignment.topLeft,
                                                                child: CircleAvatar(
                                                                  radius: 32,
                                                                  backgroundColor: food
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : Color
                                                                          .fromARGB(
                                                                              255,
                                                                              226,
                                                                              225,
                                                                              225),
                                                                  child: SvgPicture
                                                                      .asset(
                                                                    'assets/icons/food.svg',
                                                                    color: food
                                                                        ? Colors.white
                                                                        : AppColors
                                                                            .primaryColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text('Food',
                                                                style: TextStyle(
                                                                  color: food
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : AppColors
                                                                          .blackColor,
                                                                )),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  dance = !dance;
                                                                });
                                                              },
                                                              child: Align(
                                                                alignment:
                                                                    Alignment.topLeft,
                                                                child: CircleAvatar(
                                                                  radius: 32,
                                                                  backgroundColor: dance
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : Color
                                                                          .fromARGB(
                                                                              255,
                                                                              226,
                                                                              225,
                                                                              225),
                                                                  child: SvgPicture
                                                                      .asset(
                                                                    'assets/icons/music.svg',
                                                                    color: dance
                                                                        ? Colors.white
                                                                        : AppColors
                                                                            .primaryColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text('Dance',
                                                                style: TextStyle(
                                                                  color: dance
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : AppColors
                                                                          .blackColor,
                                                                )),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        'Time & Date',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          timedate = 'first';
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 81,
                                                        decoration: BoxDecoration(
                                                            color: timedate ==
                                                                    'first'
                                                                ? AppColors
                                                                    .primaryColor
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        226,
                                                                        225,
                                                                        225),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                            border: Border.all(
                                                                color: timedate ==
                                                                        'first'
                                                                    ? AppColors
                                                                        .primaryColor
                                                                    : Colors
                                                                        .black)),
                                                        child: Center(
                                                            child: Text(
                                                          'Today',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: timedate ==
                                                                      'first'
                                                                  ? Colors.white
                                                                  : Colors.black),
                                                        )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          timedate = 'second';
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 110,
                                                        decoration: BoxDecoration(
                                                            color: timedate ==
                                                                    'second'
                                                                ? AppColors
                                                                    .primaryColor
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        226,
                                                                        225,
                                                                        225),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                            border: Border.all(
                                                                color: timedate ==
                                                                        'second'
                                                                    ? AppColors
                                                                        .primaryColor
                                                                    : Colors
                                                                        .black)),
                                                        child: Center(
                                                            child: Text(
                                                          'Tomorrow',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: timedate ==
                                                                      'second'
                                                                  ? Colors.white
                                                                  : Colors.black),
                                                        )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          timedate = 'third';
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 107,
                                                        decoration: BoxDecoration(
                                                            color: timedate ==
                                                                    'third'
                                                                ? AppColors
                                                                    .primaryColor
                                                                : Color
                                                                    .fromARGB(
                                                                        255,
                                                                        226,
                                                                        225,
                                                                        225),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                            border: Border.all(
                                                                color: timedate ==
                                                                        'third'
                                                                    ? AppColors
                                                                        .primaryColor
                                                                    : Colors
                                                                        .black)),
                                                        child: Center(
                                                            child: Text(
                                                          'This week',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: timedate ==
                                                                      'third'
                                                                  ? Colors.white
                                                                  : Colors.black),
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 15, right: 15),
                                                  child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Container(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          _selectDate(context);
                                                        },
                                                        child: EBEditText(
                                                          enabled: false,
                                                          hint:
                                                              "Choose from calander",
                                                          // textEditingController:
                                                          //     _birthDateCtr,
                                                          textInputType:
                                                              TextInputType
                                                                  .datetime,
                                                          prefixIcon: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Transform.scale(
                                                                scale: 1,
                                                                child: SvgPicture
                                                                    .asset(
                                                                  "assets/icons/events.svg",
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                )),
                                                          ),
                                                          suffixIcon: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Transform.scale(
                                                                scale: 1,
                                                                child: Icon(
                                                                  Icons.arrow_right,
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        'Location',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  height: 65,
                                                  width: 334,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                  child: Row(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Container(
                                                            height: 45,
                                                            width: 45,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: AppColors
                                                                    .saveBgColor
                                                                    .withOpacity(
                                                                        0.5)),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(8),
                                                              child: Container(
                                                                height: 35,
                                                                width: 35,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                10),
                                                                    color: Colors
                                                                        .white),
                                                                child: Center(
                                                                  child: SvgPicture
                                                                      .asset(
                                                                          'assets/icons/map.svg'),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 13,
                                                      ),
                                                      Text(
                                                        'New Yourk, USA',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black),
                                                      ),
                                                      SizedBox(
                                                        width: 109,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          GoogleMap(
                                                            zoomControlsEnabled:
                                                                false,
                                                            myLocationButtonEnabled:
                                                                true,
                                                            myLocationEnabled: true,
                                                            markers: markers,
                                                            onTap: (latlng) {
                                                              if (markers
                                                                  .isNotEmpty) {
                                                                markers.clear();
                                                              }
                                                              addMarker(latlng);
                                                            },
                                                            initialCameraPosition:
                                                                CameraPosition(
                                                              target:
                                                                  LatLng(0.0, 0.0),
                                                              zoom: 0,
                                                            ),
                                                            onMapCreated:
                                                                (GoogleMapController
                                                                    controller) {
                                                              _controller.complete(
                                                                  controller);
                                                            },
                                                          );
                                                        },
                                                        child: Transform.scale(
                                                          scale: 1,
                                                          child: Icon(
                                                            Icons.arrow_right,
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Select price range',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                        //"\$${_currentRangeValues.start.toInt().toString()}-\$${_currentRangeValues.end.toInt().toString()}",
                                                        "\$10-\$150",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RangeSlider(
                                                  values: _currentRangeValues,
                                                  max: 150,
                                                  min: 10,
                                                  divisions: max(10, 150),
                                                  activeColor:
                                                      AppColors.primaryColor,
                                                  inactiveColor:
                                                      AppColors.saveBgColor,
                                                  labels: RangeLabels(
                                                    _currentRangeValues.start
                                                        .round()
                                                        .toString(),
                                                    _currentRangeValues.end
                                                        .round()
                                                        .toString(),
                                                  ),
                                                  onChanged: (RangeValues values) {
                                                    setState(() {
                                                      _currentRangeValues = values;
                                                    });
                                                  },
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 45,
                                                        width: 130,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                            border: Border.all(
                                                                color:
                                                                    Colors.black)),
                                                        child: Center(
                                                          child: Text(
                                                            'RESET',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 45,
                                                        width: 185,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                            color: AppColors
                                                                .primaryColor),
                                                        child: Center(
                                                          child: Text(
                                                            'APPLY',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
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
                          child: SvgPicture.asset("assets/icons/filtors.svg")),
                    ],
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 12, right: 12, top: 0),
              //   child: SearchBar(
              //     data: "",
              //     type: "",
              //     // textEditingController: searchCtr,
              //     onChanged: (value) {
              //       setState(() {
            
              //       });
              //     },
              //   ),
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, top: 22, right: 14),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ScrollConfiguration(
                      behavior: NoGlow(),
                      child: ListView.separated(
                        // physics: AlwaysScrollableScrollPhysics(
                        // ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: eventList.length,
                        itemBuilder: (context, index) {
                          return VerticalAnim(
                            index: index,
                            child: GestureDetector(
                                onTap: () {
                                  globalNavigatorKey.currentState?.push(SlideRightRoute(
                                      page: EventDetailsScreen(),
                                      settings: RouteSettings(
                                          name:
                                              EventDetailsScreen.eventDetailsScreen)));
                                },
                                child: SearchItemWidget(eventModel: eventList[index])),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime.now());
    if (picked != null) {
      _birthDateCtr.text =
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
    }
  }
}
