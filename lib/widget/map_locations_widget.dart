import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/utils/EBToast.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MapLocationsWidget extends StatefulWidget {
  MapLocationsWidget({Key? key, required this.eventModel}) : super(key: key);
  EventModel eventModel;

  @override
  State<MapLocationsWidget> createState() => _MapLocationsWidgetState();
}

class _MapLocationsWidgetState extends State<MapLocationsWidget> {
  bool save = false;
  saved() {
    setState(() {
      save = !save;
      if (save)
        EbToast.instance.simpleMessage(context, "Event saved successfully");
      if (!save)
        EbToast.instance.simpleMessage(context, "Event removed successfully");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Container(
        height: 106,
        width: 325,
        decoration: BoxDecoration(
            color: AppColors.saveBgColor,
            borderRadius: BorderRadius.circular(10)),

        // color: AppColors.artColor,
        child: Row(
          children: [
            SizedBox(
              width: 7,
            ),
            Container(
              height: 95,
              width: 85,
              decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.whiteColor)
                    ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "${widget.eventModel.image}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      "${widget.eventModel.date}",
                    )),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 28,
                          width: 28,
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
                    )
                  ],
                ),
                Text(
                  "${widget.eventModel.title}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/map.svg",
                      color: AppColors.orTextColor,
                    ),
                    Text(
                      "${widget.eventModel.address}",
                      style:
                          TextStyle(color: AppColors.orTextColor, fontSize: 13),
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
