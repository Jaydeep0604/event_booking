import 'package:event_booking/model/notification_model.dart';
import 'package:event_booking/ui/animations/horizontal_list_anim.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/widget/EB_EditText_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);
  static const addScreen = 'addscreen';

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  bool sport = true;
  bool music = false;
  bool art = false;
  bool food = false;
  bool dance = false;

  TextEditingController _birthDateCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                width: 180,
                child: Image.asset("assets/icons/splash_logo.png")),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Select Event',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 14),
                height: 97,
                child: HorizontalAnim(
                  index: 1,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sport = true;
                                music = false;
                                art = false;
                                food = false;
                                dance = false;
                              });
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundColor: sport
                                    ? AppColors.primaryColor
                                    : Color.fromARGB(255, 226, 225, 225),
                                child: SvgPicture.asset(
                                  'assets/icons/sports.svg',
                                  color:
                                      sport ? Colors.white : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Sports',
                              style: TextStyle(
                                color: sport
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sport = false;
                                music = true;
                                art = false;
                                food = false;
                                dance = false;
                              });
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundColor: music
                                    ? AppColors.primaryColor
                                    : Color.fromARGB(255, 226, 225, 225),
                                child: SvgPicture.asset(
                                  'assets/icons/music.svg',
                                  color:
                                      music ? Colors.white : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Music',
                              style: TextStyle(
                                color: music
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sport = false;
                                music = false;
                                art = true;
                                food = false;
                                dance = false;
                              });
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundColor: art
                                    ? AppColors.primaryColor
                                    : Color.fromARGB(255, 226, 225, 225),
                                child: SvgPicture.asset(
                                  'assets/icons/art.svg',
                                  color:
                                      art ? Colors.white : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Art',
                              style: TextStyle(
                                color: art
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sport = false;
                                music = false;
                                art = false;
                                food = true;
                                dance = false;
                              });
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundColor: food
                                    ? AppColors.primaryColor
                                    : Color.fromARGB(255, 226, 225, 225),
                                child: SvgPicture.asset(
                                  'assets/icons/food.svg',
                                  color:
                                      food ? Colors.white : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Food',
                              style: TextStyle(
                                color: food
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sport = false;
                                music = false;
                                art = false;
                                food = false;
                                dance = true;
                              });
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundColor: dance
                                    ? AppColors.primaryColor
                                    : Color.fromARGB(255, 226, 225, 225),
                                child: SvgPicture.asset(
                                  'assets/icons/music.svg',
                                  color:
                                      dance ? Colors.white : AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Dance',
                              style: TextStyle(
                                color: dance
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Event's Date",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: EBEditText(
                        enabled: false,
                        hint: "Choose from calander",
                        // textEditingController:
                        //     _birthDateCtr,
                        textInputType: TextInputType.datetime,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Transform.scale(
                              scale: 1,
                              child: SvgPicture.asset(
                                "assets/icons/events.svg",
                                color: AppColors.primaryColor,
                              )),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Transform.scale(
                              scale: 1,
                              child: Icon(
                                Icons.arrow_right,
                                color: AppColors.primaryColor,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Event's Title",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 4, right: 14, left: 14),
                child: Column(
                  children: [
                    EBEditText(
                      // controller: UserNameCtr,
                      textInputType: TextInputType.text,
                      hint: "Enter Your Event Title",
      
                      inputformtters: [
                        LengthLimitingTextInputFormatter(40),
                      ],
                      // validator: (value) {
                      //   if (value?.trimLeft().trimRight().isEmpty ?? true) {
                      //     return "Please enter Your Event Title";
                      //   }
      
                      //   return null;
                      // },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Event's Discription",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 4, right: 14, left: 14),
                child: Column(
                  children: [
                    EBEditText(
                      // controller: UserNameCtr,
                      textInputType: TextInputType.text,
                      hint: "Enter Your Event's Discription",
      
                      inputformtters: [
                        LengthLimitingTextInputFormatter(150),
                      ],
                      // validator: (value) {
                      //   if (value?.trimLeft().trimRight().isEmpty ?? true) {
                      //     return "Please enter Your Event Title";
                      //   }
      
                      //   return null;
                      // },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Event's Address",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 4, right: 14, left: 14),
                child: Column(
                  children: [
                    EBEditText(
                      // controller: UserNameCtr,
                      textInputType: TextInputType.text,
                      hint: "Enter Your Event's Address",
      
                      inputformtters: [
                        LengthLimitingTextInputFormatter(150),
                      ],
                      // validator: (value) {
                      //   if (value?.trimLeft().trimRight().isEmpty ?? true) {
                      //     return "Please enter Your Event Title";
                      //   }
      
                      //   return null;
                      // },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 50),
                child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {},
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: Text('Create Your Event',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset("assets/icons/right.svg"))
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime.now());
    if (picked != null) {
      _birthDateCtr.text =
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
    }
  }
}
