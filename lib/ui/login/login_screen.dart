import 'package:event_booking/ui/base/base.dart';
import 'package:event_booking/ui/explore/explore_screen.dart';
import 'package:event_booking/ui/forgot_password/forgot_password_screen.dart';
import 'package:event_booking/ui/signup/signup_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/widget/EB_EditText_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const loginScreen = "loginscreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailCtr = TextEditingController();
  late TextEditingController passwordCtr = TextEditingController();
  bool _obsecureText = true;
  bool switchValue = true;
  bool isLoading = false;
  bool validate = false;
  void _toggleObscured() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 73),
                    child: Container(
                      height: 58,
                      width: 58,
                      child: SvgPicture.asset(
                        "assets/icons/logo.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Container(
                        child: Text(
                      "EventHub",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    )),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 29),
                    child: Container(
                        child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )),
                  ),
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
                  padding: EdgeInsets.only(top: 15, right: 30, left: 30),
                  child: Column(
                    children: [
                      EBEditText(
                        controller: passwordCtr,
                        hint: "Enter Password",
                        prefixIcon: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            "assets/icons/Password.svg",
                          ),
                        ),
                        obsecureText: _obsecureText,
                        textInputType: TextInputType.visiblePassword,
                        inputformtters: [
                          FilteringTextInputFormatter.deny(' '),
                          LengthLimitingTextInputFormatter(16)
                        ],
                        validator: (value) {
                          if (value == "" || (value?.trim().isEmpty ?? true)) {
                            return "Please enter password";
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: _toggleObscured,
                          child: Transform.scale(
                            scale: 0.5,
                            child: ImageIcon(
                              _obsecureText
                                  ? AssetImage(
                                      "assets/icons/hide.png",
                                    )
                                  : AssetImage(
                                      "assets/icons/view.png",
                                    ),
                              size: 12,
                              // color: AppColors.button_color,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          // This bool value toggles the switch.
                          value: switchValue,
                          activeColor: AppColors.primaryColor,
                          onChanged: (bool? value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              switchValue = value ?? false;
                            });
                          },
                        ),
                      ),
                      Text("Remember Me"),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (() {
                              setState(() {
                                // emailCtr.clear();
                                // passwordctr.clear();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen()));
                              });
                            }),
                            child: Container(
                              padding: EdgeInsets.only(top: 0.2),
                              alignment: Alignment.topRight,
                              child: Text('Forgot Password?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          // fontFamily: KSMFontFamily.robotoRgular,
                                          color: AppColors.blackColor)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 52, left: 52, top: 20),
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
                            child: Text('Sign In',
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Base()));
                              // loginBloc.add(
                              //   LoginSubmitEvent(
                              //     authModel: AuthModel(
                              //       password: passwordCtr.text.trim(),
                              //       email: emailCtr.text.trim(),
                              //     ),
                              //   ),
                              // );
                              // CToast.instance.showSuccess(context,
                              //     "Data added in ( RegisterSubmitEvent )");
                            }
                          },
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Container(
                          child: Text(
                        "OR",
                        style: TextStyle(
                            color: AppColors.orTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                    ),
                  ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/google.svg"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Login with Google",
                            style: TextStyle(color: AppColors.blackColor)),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/facebook.svg"),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Login with Google",
                          style: TextStyle(color: AppColors.blackColor),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account? "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: AppColors.primaryColor),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
