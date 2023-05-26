import 'package:event_booking/ui/login/login_screen.dart';
import 'package:event_booking/ui/verification/verification_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/widget/EB_EditText_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const signUpScreen = "signupscreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailCtr = TextEditingController();
  late TextEditingController passwordctr = TextEditingController();
  late TextEditingController confirmPasswordctr = TextEditingController();
  late TextEditingController UserNameCtr = TextEditingController();
  bool p_isObscure = true;
  bool pc_isObscure = false;
  bool checkbox = false;
  bool _obsecurePassText = true;
  bool _obsecureConPassText = true;
    
  bool isLoading = false;
  bool validate = false;
  void _toggleObscured() {
    setState(() {
      _obsecurePassText = !_obsecurePassText;
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obsecureConPassText = !_obsecureConPassText;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.whiteColor,
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
        child: Form(
          key: _formKey,
          child: ScrollConfiguration(
            behavior: NoGlow(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 29),
                      child: Container(
                          child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4, right: 30, left: 30),
                    child: Column(
                      children: [
                        EBEditText(
                          controller: UserNameCtr,
                          textInputType: TextInputType.text,
                          hint: "Enter Your Username",
                          prefixIcon: Transform.scale(
                            scale: 0.5,
                            child: SvgPicture.asset(
                              "assets/icons/Profile.svg",
                            ),
                          ),
                          inputformtters: [
                            LengthLimitingTextInputFormatter(30),
                            FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'),
                                allow: true),
                            LengthLimitingTextInputFormatter(25)
                          ],
                          validator: (value) {
                            if (value?.trimLeft().trimRight().isEmpty ?? true) {
                              return "Please enter Username";
                            }
                            if (value != null && value.length < 3) {
                              return "Username must be minimum 3 characters";
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
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, right: 30, left: 30),
                      child: EBEditText(
                          controller: passwordctr,
                          hint: "Enter Password",
                          prefixIcon: Transform.scale(
                            scale: 0.5,
                            child: SvgPicture.asset(
                              "assets/icons/Password.svg",
                            ),
                          ),
                          obsecureText: _obsecurePassText,
                          textInputType: TextInputType.visiblePassword,
                          inputformtters: [
                            FilteringTextInputFormatter.deny(' '),
                            LengthLimitingTextInputFormatter(16)
                          ],
                          suffixIcon: GestureDetector(
                            onTap: _toggleObscured,
                            child: Transform.scale(
                              scale: 0.5,
                              child: ImageIcon(
                                _obsecurePassText
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
                          validator: (val) {
                            if (val!.isEmpty) return 'Please Your Password';
                            return null;
                          }),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                      child: EBEditText(
                          controller: confirmPasswordctr,
                          hint: "Enter Confirm Password",
                          prefixIcon: Transform.scale(
                            scale: 0.5,
                            child: SvgPicture.asset(
                              "assets/icons/Password.svg",
                            ),
                          ),
                          obsecureText: _obsecureConPassText,
                          textInputType: TextInputType.visiblePassword,
                          inputformtters: [
                            FilteringTextInputFormatter.deny(' '),
                            LengthLimitingTextInputFormatter(16)
                          ],
                          suffixIcon: GestureDetector(
                            onTap: _toggleObscured2,
                            child: Transform.scale(
                              scale: 0.5,
                              child: ImageIcon(
                                _obsecureConPassText
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
                          validator: (val) {
                            if (val!.isEmpty)
                              return 'Please Enter Confirm Password';
                            if (val != passwordctr.text)
                              return 'Password Not Match';
                            return null;
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                              child: Text('Sign Up',
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
                                        builder: (context) =>
                                            VerificationScreen()));
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
                      Text("Have an account? "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: AppColors.primaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
