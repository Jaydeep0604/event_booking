import 'package:event_booking/navigator/tab_item.dart';
import 'package:event_booking/ui/base/base.dart';
import 'package:event_booking/ui/login/login_screen.dart';
import 'package:event_booking/ui/profile/profile_screen.dart';
import 'package:event_booking/utils/EBToast.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../utils/dark_theme_provider.dart';

class EBDrawer extends StatefulWidget {
  const EBDrawer({Key? key}) : super(key: key);

  @override
  State<EBDrawer> createState() => _EBDrawerState();
}

class _EBDrawerState extends State<EBDrawer> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
      )),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.saveBgColor,
              ),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        navigatorKeys[Base.getCurrentTab(context)]
                            ?.currentState
                            ?.pushNamed(ProfileScreen.profileScreen);
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/images/profile_cover.png",
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Ashfak Sayem",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
              Expanded(
                flex: 1,
                child: Container(
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //       image: AssetImage(
                  //         avm_splash_logo_bg,
                  //       ),
                  //       alignment: Alignment.bottomCenter,
                  //       colorFilter: ColorFilter.mode(
                  //           AppColors.scaffold_background.withOpacity(0.06),
                  //           BlendMode.dstATop),
                  //       fit: BoxFit.contain),
                  // ),
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: ScrollConfiguration(
                    behavior: NoGlow(),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ListTile(
                          title: Text(
                            "Dark Mode",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: themeChange.darkTheme,
                              activeColor: AppColors.saveBgColor,
                              thumbColor: AppColors.blackColor,
                              onChanged: (bool value) {
                                setState(() {
                                  themeChange.darkTheme = value;
                                  
                                  //  Navigator.pop(context);
                                  // if (themeChange.darkTheme)
                                  //   EbToast.instance.simpleMessage(
                                  //       context, "Dark mode enabled");
                                  // if (!themeChange.darkTheme)
                                  //   EbToast.instance.simpleMessage(
                                  //       context, "Dark mode enabled");
                                });
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          leading: SvgPicture.asset("assets/icons/profile.svg",
                              color: AppColors.primaryColor),
                          title: Text(
                            "My Profile",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            navigatorKeys[Base.getCurrentTab(context)]
                                ?.currentState
                                ?.pushNamed(ProfileScreen.profileScreen);
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset("assets/icons/message.svg",
                              color: AppColors.primaryColor),
                          title: Text(
                            "Massage",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            EbToast.instance
                                .showErrorMessage(context, "Not developed");
                            // Navigator.pop(context);
                            // navigatorKeys[Base.getCurrentTab(context)]
                            //     ?.currentState
                            //     ?.pushNamed(MyBusiness.myBusinessUrl);
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset("assets/icons/events.svg",
                              color: AppColors.primaryColor),
                          title: Text(
                            "Calender",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            EbToast.instance
                                .showErrorMessage(context, "Not developed");
                            // navigatorKeys[Base.getCurrentTab(context)]
                            //     ?.currentState
                            //     ?.pushNamed(EventScreen.eventScreen);
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset("assets/icons/save.svg",
                              color: AppColors.primaryColor),
                          title: Text(
                            "Bookmark",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            EbToast.instance
                                .showErrorMessage(context, "Not developed");
                            // Navigator.pop(context);
                            // navigatorKeys[Base.getCurrentTab(context)]
                            //     ?.currentState
                            //     ?.pushNamed(Payments.payments);
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset("assets/icons/mail.svg",
                              color: AppColors.primaryColor),
                          title: Text(
                            "Contact Us",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            EbToast.instance
                                .showErrorMessage(context, "Not developed");
                            // Navigator.pop(context);
                            // navigatorKeys[Base.getCurrentTab(context)]
                            //     ?.currentState
                            //     ?.pushNamed(Transaction.transactionUrl);
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset("assets/icons/settings.svg",
                              color: AppColors.primaryColor),
                          title: Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            EbToast.instance
                                .showErrorMessage(context, "Not developed");
                            // Navigator.pop(context);
                            // navigatorKeys[Base.getCurrentTab(context)]
                            //     ?.currentState
                            //     ?.pushNamed(NotificationPage.notificationPageUrl);
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset("assets/icons/settings.svg",
                              color: AppColors.primaryColor),
                          title: Text(
                            "Helps & FAQs",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            EbToast.instance
                                .showErrorMessage(context, "Not developed");
                            // Navigator.pop(context);
                            // navigatorKeys[Base.getCurrentTab(context)]
                            //     ?.currentState
                            //     ?.pushNamed(ComplainsList.complainsListUrl);
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset("assets/icons/logout.svg",
                              color: AppColors.primaryColor),
                          title: Text(
                            "Sign Out",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            showLogoutDialog(context).then((value) {
                              if (value != null) {
                                if (value) {
                                  //userStateContainerState.logOutUser().then((value) {
                                  if (value) {
                                    // sharedStore.closeSession();
                                    // userStateContainerState.updateUser(
                                    //     userResponseModel: null);
                                    // userStateContainerState
                                    //     .updateLoggedStatus(false)

                                    Navigator.pushReplacementNamed(
                                      context,
                                      LoginScreen.loginScreen,
                                    );
                                  }
                                  //});
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Future<bool?> showLogoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "Are you sure you want to logout",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: AppColors.blackColor, fontSize: 16),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 14),
                          child: FlatButton(
                            minWidth: 400,
                            height: 40,
                            color: AppColors.saveBgColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: new Text(
                              "Cancel",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                            ),
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 14),
                          child: FlatButton(
                            minWidth: 400,
                            height: 40,
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              "Logout",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            onPressed: () {
                              // if (context.read<NetworkBloc>().state
                              //     is ConnectionFailure) {
                              //   AvmToast.instance.showErrorMessage(
                              //       context, "${ApiConstant.NO_INTERNET}");
                              //   return;
                              // }
                              Navigator.pop(context, true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
