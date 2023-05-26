import 'package:event_booking/model/interest_model.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';

class InterestWidget extends StatefulWidget {
  InterestWidget({Key? key, required this.interestModel}) : super(key: key);
  InterestModel interestModel;

  @override
  State<InterestWidget> createState() => _InterestWidgetState();
}

class _InterestWidgetState extends State<InterestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 31,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: AppColors.artColor),
        child: Center(
          child: Text(
            "${widget.interestModel.interest}",maxLines: 1,
            style: TextStyle(fontSize: 14,color: AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
