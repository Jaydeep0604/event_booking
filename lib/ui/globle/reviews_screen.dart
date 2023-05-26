import 'package:event_booking/model/globle_model.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/widget/review_widet.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
    final controller=ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Reviews> reviewList = [
    // EventModel("id", "date", true, "title", "total_going", "address"),
    Reviews(
        "1",
        "assets/images/jazz.png",
        "Rocks Velkeinjen",
        "10 Feb",
        3,
        "Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you."),
    Reviews(
        "2",
        "assets/images/event2.png",
        "Angelina Zolly",
        "10 Feb",
        4,
        "Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you."),
    Reviews(
        "1",
        "assets/images/Women's Leadership.png",
        "Zenifero Bolex",
        "10 Feb",
        2,
        "Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you."),   
  ];
    return Padding(
      padding: const EdgeInsets.only(left: 24,right: 24,top: 24),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: reviewList.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                // globalNavigatorKey.currentState?.push(SlideRightRoute(
                //     page: EventDetailsScreen(),
                //     settings: RouteSettings(
                //         name: EventDetailsScreen.eventDetailsScreen)));
              },
              child: VerticalAnim(
                index: index,
                child: ReviewWidget(reviews:  reviewList[index])));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox();
        },
      ),
    );
  }
}
