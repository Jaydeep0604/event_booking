import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/utils/EBToast.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventWidget extends StatefulWidget {
  EventWidget({Key? key, required this.eventModel}) : super(key: key);
  EventModel eventModel;

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
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
    return Container(
      height: 255,
      width: 237,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 131,
              child: Stack(
                children: [
                  Container(
                    height: 131,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.whiteColor)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("${widget.eventModel.image}")),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.eventModel.date}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.sportColor, fontSize: 12),
                            ),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: save
                                    ? AppColors.whiteColor
                                    : AppColors.sportColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: GestureDetector(
                              onTap: saved,
                              child: Transform.scale(
                                  scale: 0.6,
                                  child: save
                                      ? SvgPicture.asset(
                                          "assets/icons/save.svg",
                                        )
                                      : SvgPicture.asset(
                                          "assets/icons/unSave.svg",
                                        )),
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "${widget.eventModel.title}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  width: 56,
                  child: Stack(children: [
                    Container(
                        height: 24,
                        width: 24,
                        child: Image.asset("${widget.eventModel.ovel1}")),
                    Center(
                      child: Container(
                          height: 24,
                          width: 24,
                          child: Image.asset("${widget.eventModel.ovel2}")),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 24,
                          width: 24,
                          child: Image.asset("${widget.eventModel.ovel3}")),
                    )
                  ]),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "+${widget.eventModel.total_going} Going",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 12),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/map.svg",
                  color: AppColors.orTextColor,
                ),
                Text(
                  "${widget.eventModel.address}",
                  style: TextStyle(color: AppColors.orTextColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
