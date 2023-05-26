import 'dart:async';
import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/ui/animations/grid_list_anim.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/ui/event/event_details_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/utils/route_transition.dart';
import 'package:event_booking/widget/EB_EditText_widget.dart';
import 'package:event_booking/widget/map_locations_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  LatLng? latLng;
  String? title;
  MapScreen({Key? key, this.latLng, this.title}) : super(key: key);
  static const mapScreen = 'mapscreen';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> markers = Set.from([]);
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    if (widget.latLng != null) {
      addMarker(widget.latLng!);
    }
  }

  List<EventModel> eventList = [
    // EventModel("id", "date", true, "title", "total_going", "address"),
    EventModel(
        "1",
        "assets/images/img1.png",
        "Wed, Apr 28 •5:30 PM",
        true,
        "Jo Malone London’s Mother’s Day Presents",
        "20",
        "Radius Gallery • Santa Cruz, CA",
        "assets/images/Oval1.png",
        "assets/images/Oval2.png",
        "assets/images/Oval3.png"),
    EventModel(
        "2",
        "assets/images/img1.png",
        "10 June",
        true,
        "Jo Malone London’s Mo..",
        "20",
        "Radius Gallery • Santa Cruz, CA",
        "assets/images/Oval1.png",
        "assets/images/Oval2.png",
        "assets/images/Oval3.png"),
    EventModel(
        "2",
        "assets/images/img1.png",
        "10 June",
        true,
        "Jo Malone London’s Mo..",
        "20",
        "Radius Gallery • Santa Cruz, CA",
        "assets/images/Oval1.png",
        "assets/images/Oval2.png",
        "assets/images/Oval3.png"),
  ];
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

  TextEditingController searchCtr = TextEditingController();
  void clearText() {
    searchCtr.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: markers,
              onTap: (latlng) {
                if (markers.isNotEmpty) {
                  markers.clear();
                }
                addMarker(latlng);
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(0.0, 0.0),
                zoom: 0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 55, right: 30, left: 30),
                  child: GrideListAnim(
                    index: 1,
                    delay: Duration(milliseconds: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: EBESearchText(
                            controller: searchCtr,
                            textInputType: TextInputType.text,
                            hint: "Find for food or restaurant...",
                            prefixIcon: InkWell(
                              onTap: () {
                                clearText();
                              },
                              child: Transform.scale(
                                scale: 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: SvgPicture.asset(
                                    "assets/icons/back.svg",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(15),
                            child: SvgPicture.asset("assets/icons/map_search.svg"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  child: HorizontalAnim(
                    index: 1,
                    
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 25,
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
                ),
              ],
            ),
            Align(    
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
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
                            child:
                                MapLocationsWidget(eventModel: eventList[index])),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
