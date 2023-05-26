import 'package:event_booking/model/notification_model.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  NotificationWidget({Key? key, required this.notificationModel})
      : super(key: key);
  NotificationModel notificationModel;

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool accept = false;
  bool reject = false;
  bool rejected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (reject == true) Container(),
        if (reject == false)
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.notificationColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "${widget.notificationModel.img}",
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text.rich(TextSpan(
                                  text:
                                      '${widget.notificationModel.followerName} ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor),
                                  children: <InlineSpan>[
                                    if (widget.notificationModel.inviteFrom !=
                                            "" &&
                                        widget.notificationModel.invite ==
                                            true &&
                                        widget.notificationModel.follow ==
                                            false &&
                                        widget.notificationModel.like ==
                                            false &&
                                        widget.notificationModel.joinEvent ==
                                            "")
                                      TextSpan(
                                        text:
                                            '${widget.notificationModel.inviteFrom}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    if (widget.notificationModel.invite ==
                                            false &&
                                        widget.notificationModel.inviteFrom ==
                                            "" &&
                                        widget.notificationModel.follow ==
                                            true &&
                                        widget.notificationModel.like ==
                                            false &&
                                        widget.notificationModel.joinEvent ==
                                            "")
                                      TextSpan(
                                        text: 'Started following you',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    if (widget.notificationModel.invite ==
                                            false &&
                                        widget.notificationModel.inviteFrom ==
                                            "" &&
                                        widget.notificationModel.like == true &&
                                        widget.notificationModel.joinEvent ==
                                            "")
                                      TextSpan(
                                        text: 'Like your events',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    if (widget.notificationModel.invite ==
                                            false &&
                                        widget.notificationModel.inviteFrom ==
                                            "" &&
                                        widget.notificationModel.like ==
                                            false &&
                                        widget.notificationModel.joinEvent !=
                                            "")
                                      TextSpan(
                                        text:
                                            'Join your Event Gala Music Festival',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    if (accept == true &&
                                        widget.notificationModel.inviteFrom !=
                                            "" &&
                                        widget.notificationModel.invite ==
                                            false &&
                                        widget.notificationModel.follow ==
                                            false &&
                                        widget.notificationModel.like ==
                                            false &&
                                        widget.notificationModel.joinEvent ==
                                            "")
                                      TextSpan(
                                        text: 'Started following you',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                  ])),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${widget.notificationModel.timing}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.notificationTextColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        if (widget.notificationModel.invite == true)
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    reject = true;
                                  });
                                },
                                child: Container(
                                  height: 36,
                                  width: 95,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColors.primaryColor)),
                                  child: Center(
                                      child: Text(
                                    "Reject",
                                    style:
                                        TextStyle(color: AppColors.blackColor),
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    accept = true;
                                    widget.notificationModel.invite = false;
                                  });
                                },
                                child: Container(
                                  height: 36,
                                  width: 95,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.primaryColor),
                                  child: Center(
                                      child: Text(
                                    "Accept",
                                    style:
                                        TextStyle(color: AppColors.whiteColor),
                                  )),
                                ),
                              )
                            ],
                          ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
