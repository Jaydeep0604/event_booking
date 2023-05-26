import 'package:event_booking/ui/login/login_screen.dart';
import 'package:event_booking/utils/app_colors.dart';
import 'package:event_booking/utils/functions.dart';
import 'package:event_booking/widget/otp_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);
  static const verificationScreen = "verificationscreen";

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  bool isLoading = false;
  bool showResendButton = false;

  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: ScrollConfiguration(
            behavior: NoGlow(),
            child: SingleChildScrollView(
                  child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 29),
                  child: Container(
                      child: Text(
                    "Verification",
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
                  padding: const EdgeInsets.only(top: 12, left: 28, right: 103),
                  child: Container(
                      child: Text(
                    "We’ve send you the verification code on +1 2620 0323 7631",
                    style: TextStyle(color: AppColors.blackColor, fontSize: 15),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInput(_fieldOne, true), // auto focus
                  OtpInput(_fieldTwo, false),
                  OtpInput(_fieldThree, false),
                  OtpInput(_fieldFour, false)
                ],
              ),
              const SizedBox(
                height: 30,
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
                          child: Text('Continue',
                              style: Theme.of(context).textTheme.button?.copyWith(
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
                          setState(() {
                            _otp = _fieldOne.text +
                                _fieldTwo.text +
                                _fieldThree.text +
                                _fieldFour.text;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          });
                        },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                          text: "Re-send code in ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        showResendButton
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showResendButton = false;
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    "Resend",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                    !showResendButton
                        ? Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Re-send code in",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                OtpTimer(
                                  onResendTimeUpCallBack: () {
                                    setState(() {
                                      showResendButton = true;
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              // Display the entered OTP code
              // Text(
              //   _otp ?? 'Please enter OTP',
              //   style: const TextStyle(fontSize: 30),
              // )
            ],
                  ),
                ),
          )),
    );
  }
}

  class OtpInput extends StatelessWidget {
    final TextEditingController controller;
    final bool autoFocus;
    const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 60,
        width: 50,
        child: TextField(
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          cursorColor: Theme.of(context).primaryColor,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              counterText: '',
              hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      );
    }
  }
