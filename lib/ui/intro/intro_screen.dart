import 'package:event_booking/ui/login/login_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // bool byskip = true;
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<UnbordingContent> contents = [
      UnbordingContent(
          title: ' Explore Upcoming and Nearby Events ',
          image: 'assets/images/1.png',
          discription:
              " In publishing and graphic design, Lorem is a placeholder text commonly "),
      UnbordingContent(
          title: ' Web Have Modern Events Calendar Feature',
          image: 'assets/images/2.png',
          discription:
              " In publishing and graphic design, Lorem is a placeholder text commonly "),
      UnbordingContent(
          title: '  To Look Up More Events or Activities Nearby By Map',
          image: 'assets/images/3.png',
          discription:
              " In publishing and graphic design, Lorem is a placeholder text commonly "),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Expanded(
            child: Stack(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: ScrollConfiguration(
                    behavior: NoGlow(),
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: contents.length,
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (BuildContext, i) {
                        return Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 80, left: 43),
                              child: Image.asset(
                                contents[i].image,
                                height: 430,
                                width: 270,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 500),
                    child: Container(
                        height: 259,
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          // color: AppColors.primaryColor,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            currentIndex == 0
                                ? Text(
                                    'Explore Upcoming and ',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : currentIndex == 1
                                    ? Text(
                                        'Web Have Modern Events ',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        'To Look Up More Events or ',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                            SizedBox(
                              height: 5,
                            ),
                            currentIndex == 0
                                ? Text(
                                    'Nearby Events',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : currentIndex == 1
                                    ? Text(
                                        'Calendar Feature',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        'Activities Nearby By Map',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                            SizedBox(
                              height: 15,
                            ),
                            currentIndex == 0
                                ? Text(
                                    ' In publishing and graphic design, Lorem is  ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                : currentIndex == 1
                                    ? Text(
                                        ' In publishing and graphic design, Lorem is  ',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    : Text(
                                        'In publishing and graphic design, Lorem is  ',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                            SizedBox(
                              height: 5,
                            ),
                            currentIndex == 0
                                ? Text(
                                    'a placeholder text commonly',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                : currentIndex == 1
                                    ? Text(
                                        'a placeholder text commonly',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    : Text(
                                        'a placeholder text commonly',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                },
                                child: Text(
                                  currentIndex == 2 ? "" : "Skip",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ))),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              contents.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                if (currentIndex == contents.length - 1) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginScreen(),
                                    ),
                                  );
                                }
                                _controller.nextPage(
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.bounceIn,
                                );
                              },
                              child: Text(
                                currentIndex == 2 ? "Done" : "Next",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.white : Colors.grey,
      ),
    );
  }
}

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}
