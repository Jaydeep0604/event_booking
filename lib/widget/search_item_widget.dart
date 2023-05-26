import 'package:event_booking/model/event_model.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchItemWidget extends StatefulWidget {
  SearchItemWidget({Key? key, required this.eventModel}) : super(key: key);
  EventModel eventModel;

  @override
  State<SearchItemWidget> createState() => _SearchItemWidgetState();
}

class _SearchItemWidgetState extends State<SearchItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.saveBgColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SizedBox(
              width: 7,
            ),
            Container(
              height: 79,
              width: 79,
              decoration:
                  BoxDecoration(
                    border: Border.all(color: AppColors.whiteColor),
                    borderRadius: BorderRadius.circular(10)
                    ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "${widget.eventModel.image}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            
            Expanded(
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.eventModel.title}",
                  ),
                  Text(
                    "${widget.eventModel.address}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
