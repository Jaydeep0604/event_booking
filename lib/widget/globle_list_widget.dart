import 'package:event_booking/model/globle_model.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';

class GlobleListWidget extends StatefulWidget {
  GlobleListWidget({Key? key, required this.globleModel}) : super(key: key);
  GlobleModel globleModel;

  @override
  State<GlobleListWidget> createState() => _GlobleListWidgetState();
}

class _GlobleListWidgetState extends State<GlobleListWidget> {
  bool follow = true;
  following() {
    setState(() {
      follow = !follow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            height: 170,
            width: 140,
            decoration: BoxDecoration(
                color: AppColors.saveBgColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 90,
                    width: 90,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "${widget.globleModel.imgUrl}",
                          fit: BoxFit.fill,
                        ))),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.globleModel.title}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    following();
                  },
                  child: Container(
                    width: 120,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: follow
                                ? AppColors.primaryColor
                                : AppColors.whiteColor),
                        color: follow
                            ? AppColors.whiteColor
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
          )
        ],
      ),
    );
  }
}
