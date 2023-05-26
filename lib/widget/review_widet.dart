import 'package:event_booking/model/globle_model.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/widget/rating_bar.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {
  ReviewWidget({Key? key,required this.reviews}) : super(key: key);
  Reviews reviews;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 133,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 34,
                    width: 34,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "${widget.reviews.imgUrl}",
                          fit: BoxFit.fill,
                        ))),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${widget.reviews.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${widget.reviews.date}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.orTextColor),
                                ),
                              ),
                            )
                          ],
                        ),
                        RatingChartRow(
                          label: widget.reviews.rating,
                        ),
                        Text(
                          '${widget.reviews.review}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
