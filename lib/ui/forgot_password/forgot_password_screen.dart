import 'package:event_booking/ui/login/login_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/widget/EB_EditText_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const forgotPasswordScreen = "forgotpasswordscreen";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailCtr = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Transform.scale(
                scale: 0.5, child: SvgPicture.asset("assets/icons/Back.svg")),
          )),
      body: SafeArea(
          child: ScrollConfiguration(
            behavior: NoGlow(),
            child: SingleChildScrollView(
                  child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 29),
                    child: Container(
                        child: Text(
                      "Resset Password",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 26, left: 28, right: 103),
                    child: Container(
                        child: Text(
                      "Please enter your email address to request a password reset",
                      style: TextStyle(color: AppColors.blackColor, fontSize: 15),
                    )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, right: 30, left: 30),
                  child: Column(
                    children: [
                      EBEditText(
                        hint: "Enter Email Address",
                        controller: emailCtr,
                        prefixIcon: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            "assets/icons/Mail.svg",
                          ),
                        ),
                        inputformtters: [
                          LengthLimitingTextInputFormatter(60),
                          FilteringTextInputFormatter.deny(" "),
                          FilteringTextInputFormatter.deny("[]"),
                          FilteringTextInputFormatter.deny("["),
                          FilteringTextInputFormatter.deny("]"),
                          FilteringTextInputFormatter.deny("^"),
                          FilteringTextInputFormatter.deny(""),
                          FilteringTextInputFormatter.deny("`"),
                          FilteringTextInputFormatter.deny("/"),
                          // FilteringTextInputFormatter.deny("\"),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-zA-z._@]')),
                          FilteringTextInputFormatter.deny(RegExp(r"/"))
                        ],
                        validator: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Please enter email address";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value ?? "")) {
                            return "Enter valid email address";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 52, left: 52, top: 40),
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 48,
                    color: AppColors.primaryColor,
                    disabledColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: Text('Send',
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
                    ),
                    onPressed: isLoading
                        ? null
                        : () {
                            FocusNode? focusNode =
                                FocusManager.instance.primaryFocus;
                            if (focusNode != null) {
                              if (focusNode.hasPrimaryFocus) {
                                focusNode.unfocus();
                              }
                            }
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            }
                          },
                  ),
                ),
              ],
            ),
                  ),
                ),
          )),
    );
  }
}
