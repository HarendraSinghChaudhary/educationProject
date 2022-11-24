import 'package:Ambitious/reusable/default_button.dart';
import 'package:Ambitious/services/snackbar.dart';
import 'package:Ambitious/utils/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/signup_controller.dart/loginSignUp_Controller.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  LoginSignUpConroller controller =
      Get.put<LoginSignUpConroller>(LoginSignUpConroller());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: h * 0.8,
          decoration: BoxDecoration(
              color: ksettingcardColor,
              borderRadius: BorderRadius.circular(h * 0.03)),
          padding: EdgeInsets.only(top: h * 0.05, left: 15, right: 15),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Center(
                child: Text(
                  controller.islogin.value ? "Log In" : 'Create Account',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.islogin.value = !controller.islogin.value;
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 2,
                  ),
                  height: 56,
                  width: 277,
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(2),
                  //   color: Color(0xff4f86eb),
                  // ),
                  child: Text(
                    controller.islogin.value
                        ? 'NEED AN ACCOUNT?'
                        : 'HAVE AN ACCOUNT?',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              !controller.islogin.value ? SignUp() : Login()
            ],
          ),
        ));
  }
}

class SignUp extends GetView<LoginSignUpConroller> {
  var formkey = GlobalKey<FormState>();
  RxBool passShow = true.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Form(
          key: formkey,
          child: Column(
            children: [
              CustomTextField(
                hintText: "First Name",
                controller: controller.first,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value!.isEmail) {
                    return "Please Enter Correct First Name";
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: "Last Name",
                controller: controller.last,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value!.isEmail) {
                    return "Please Enter Correct Last Name";
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: "Email Address",
                controller: controller.mail,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                validator: (value) {
                  if (!GetUtils.isEmail(value!)) {
                    return "Please Enter Correct Email";
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: "Password",
                controller: controller.pass,
                isobscure: passShow.value,
                suffixIcon: InkWell(
                    onTap: () {
                      passShow.value = !passShow.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        !passShow.value
                            ? "assets/images/Eye.png"
                            : "assets/images/ClosedEye.png",
                        color: kWhiteColor,
                        height: 5,
                      ),
                    )),
                validator: (value) {
                  if (!GetUtils.isLengthGreaterOrEqual(value!, 8)) {
                    return "Please Enter Correct Password";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: h * 0.04,
              ),
              controller.isLoading.value
                  ? loader
                  : DefaultButton(
                      width: w,
                      height: h * 0.065,
                      text: "SIGN UP",
                      press: () async {
                        if (formkey.currentState!.validate()) {
                          controller.isLoading.value = true;
                          await controller.register(
                              controller.first.text,
                              controller.last.text,
                              controller.mail.text,
                              controller.pass.text);

                          controller.isLoading.value = false;
                        }
                      },
                    ),
              Padding(
                padding: EdgeInsets.only(
                  top: h * 0.02,
                  left: w * 0.15,
                  right: w * 0.15,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "By creating an account you agree to our "
                          .toUpperCase(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: kWhiteColor),
                      children: [
                        TextSpan(
                          text: "terms of service".toUpperCase(),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("ckidsjbvisvhb");
                            },
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor),
                        )
                      ]),
                ),
              )
            ],
          ),
        ));
  }
}

class Login extends GetView<LoginSignUpConroller> {
  var formkey = GlobalKey<FormState>();
  RxBool passShow = true.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Form(
          key: formkey,
          child: Column(
            children: [
              CustomTextField(
                hintText: "Email Address",
                controller: controller.mail,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!GetUtils.isEmail(value!)) {
                    return "Please Enter Correct Email";
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: "Password",
                controller: controller.pass,
                isobscure: passShow.value,
                suffixIcon: InkWell(
                    onTap: () {
                      passShow.value = !passShow.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        !passShow.value
                            ? "assets/images/Eye.png"
                            : "assets/images/ClosedEye.png",
                        color: kWhiteColor,
                        height: 5,
                      ),
                    )),
                validator: (value) {
                  if (!GetUtils.isLengthGreaterOrEqual(value!, 8)) {
                    return "Please Enter Correct Password";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                        showBottumSheet(const SentMail());
                      },
                      child: const Text(
                        "FORGOT PASSWORD?",
                        style: TextStyle(
                          color: Color(0xFFd3d2da),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              controller.isLoading.value
                  ? loader
                  : DefaultButton(
                      width: w,
                      height: h * 0.065,
                      text: "LOGIN",
                      press: () async {
                        if (formkey.currentState!.validate()) {
                          controller.isLoading.value = true;
                          await controller.login(
                              controller.mail.text, controller.pass.text);
                          controller.isLoading.value = false;
                        }
                      },
                    ),
              // Padding(
              //   padding:  EdgeInsets.only(
              //     top: h*0.02,
              //     left: w*0.15,
              //     right: w*0.15,

              //   ),
              //   child: RichText(

              //     textAlign: TextAlign.center,
              //     text: TextSpan(
              //       text: "By creating an account you agree to our ".toUpperCase(),
              //       style: const TextStyle(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w300,
              //         color: kWhiteColor
              //       ),
              //       children: [
              //         TextSpan(
              //           text: "terms of service".toUpperCase(),
              //           recognizer: TapGestureRecognizer()..onTap=(){print("ckidsjbvisvhb");},
              //           style:const TextStyle(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w700,
              //         color: kWhiteColor
              //       ),
              //         )
              //       ]
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final bool? isobscure;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final Widget? suffixIcon;
  const CustomTextField({
    Key? key,
    this.textCapitalization,
    this.suffixIcon,
    this.keyboardType,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.validator,
    this.isobscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: const TextStyle(color: kWhiteColor),
        controller: controller,
        validator: validator,
        obscureText: isobscure ?? false,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
            hintText: hintText,
            fillColor: kdarkblue,
            filled: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(h * 0.02),
              borderSide: BorderSide.none,
            ),
            hintStyle: hintStyle ??
                const TextStyle(
                    color: Color(0xFFd3d2da),
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
      ),
    );
  }
}

class OtpVerfication extends StatefulWidget {
  const OtpVerfication({Key? key}) : super(key: key);

  @override
  State<OtpVerfication> createState() => _OtpVerficationState();
}

class _OtpVerficationState extends State<OtpVerfication> {
  LoginSignUpConroller controller =
      Get.put<LoginSignUpConroller>(LoginSignUpConroller());
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: h * 0.8,
          decoration: BoxDecoration(
              color: ksettingcardColor,
              borderRadius: BorderRadius.circular(h * 0.03)),
          padding: EdgeInsets.only(top: h * 0.05, left: 15, right: 15),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const Center(
                child: Text(
                  'Verify Your \nEmail Address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 2,
                ),
                height: 56,
                width: 277,
                alignment: Alignment.center,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(2),
                //   color: Color(0xff4f86eb),
                // ),
                child: Text(
                  'We sent a verification code to \n'.toUpperCase() +
                      controller.otpemail.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    //  decoration: TextDecoration.underline
                  ),
                ),
              ),
              Form(
                key: formkey,
                child: 
                CustomTextField(
                  hintText: "OTP code",
                  controller: controller.otp,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (GetUtils.isBlank(value!)!) {
                      return "Please enter otp";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.resendtp();
                      },
                      child: Text(
                        "Resend code".toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFFd3d2da),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              controller.isLoading.value
                  ? loader
                  : DefaultButton(
                      width: w,
                      height: h * 0.065,
                      text: "VERIFY",
                      press: () async {
                        if (formkey.currentState!.validate()) {
                          controller.isLoading.value = true;
                          await controller.otpVerify(controller.otp.text);

                          controller.isLoading.value = false;
                        }
                      },
                    ),
            ],
          ),
        ));
  }
}

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  LoginSignUpConroller controller =
      Get.put<LoginSignUpConroller>(LoginSignUpConroller());
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: h * 0.8,
          decoration: BoxDecoration(
              color: ksettingcardColor,
              borderRadius: BorderRadius.circular(h * 0.03)),
          padding: EdgeInsets.only(top: h * 0.05, left: 15, right: 15),
          child: Form(
            key: formkey,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                const Center(
                  child: Text(
                    'Reset Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 2,
                  ),
                  height: 56,
                  width: 277,
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(2),
                  //   color: Color(0xff4f86eb),
                  // ),
                  child: Text(
                    'You will use this to log into the \nambitious app'
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      //  decoration: TextDecoration.underline
                    ),
                  ),
                ),
                CustomTextField(
                  hintText: "Password",
                  controller: controller.pass,
                  isobscure: true,
                  validator: (value) {
                    if (!GetUtils.isLengthGreaterOrEqual(value!, 8)) {
                      return "Password length should be at atleast 8";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Confirm Password",
                  isobscure: true,
                  controller: controller.conpass,
                  validator: (value) {
                    if (value != controller.pass.text) {
                      return "Confirm Password doesn't match";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                controller.isLoading.value
                    ? loader
                    : DefaultButton(
                        width: w,
                        height: h * 0.065,
                        text: "CONTINUE",
                        press: () async {
                          if (formkey.currentState!.validate()) {
                            controller.isLoading.value = true;
                            //  await controller.login(controller.mail.text, controller.pass.text);
                            controller.resetPassword().then((value) async {
                              if (value != null) {
                                await showSnack(
                                    "Update Password Successfully", value);
                                Navigator.pop(context);
                                controller.islogin.value = true;
                                showBottumSheet(const LoginSignUp());
                              }
                            });
                            controller.isLoading.value = false;
                          }
                        },
                      ),
              ],
            ),
          ),
        ));
  }
}

class SentMail extends StatefulWidget {
  const SentMail({Key? key}) : super(key: key);

  @override
  State<SentMail> createState() => _SentMailState();
}

class _SentMailState extends State<SentMail> {
  LoginSignUpConroller controller =
      Get.put<LoginSignUpConroller>(LoginSignUpConroller());
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: h * 0.8,
          decoration: BoxDecoration(
              color: ksettingcardColor,
              borderRadius: BorderRadius.circular(h * 0.03)),
          padding: EdgeInsets.only(top: h * 0.05, left: 15, right: 15),
          child: Form(
            key: formkey,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                const Center(
                  child: Text(
                    'Request a \nPassword Reset',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  //  padding:  EdgeInsets.only(left: w*0.02,right: w*0.02),
                  height: 56,
                  width: 277,
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(2),
                  //   color: Color(0xff4f86eb),
                  // ),
                  child: Text(
                    'Enter your email and we will send you a otp to reset your password'
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      //  decoration: TextDecoration.underline
                    ),
                  ),
                ),
                CustomTextField(
                  hintText: "Email Address",
                  controller: controller.mail,
                  validator: (value) {
                    if (!GetUtils.isEmail(value!)) {
                      return "Password enter correct email";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                          controller.isforgot.value = true;
                          showBottumSheet(const LoginSignUp());
                        },
                        child: Row(
                          children: [
                            Text(
                              "Back to login ".toUpperCase(),
                              style: const TextStyle(
                                color: Color(0xFFd3d2da),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: Color(0xFFd3d2da),
                              size: h * 0.02,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                controller.isLoading.value
                    ? loader
                    : DefaultButton(
                        width: w,
                        height: h * 0.065,
                        text: "SEND OTP",
                        press: () async {
                          if (formkey.currentState!.validate()) {
                            //  await controller.login(controller.mail.text, controller.pass.text);
                            controller.isLoading.value = true;
                            await controller.sendMail(controller.mail.text);

                            controller.isLoading.value = false;
                          }
                        },
                      ),
              ],
            ),
          ),
        ));
  }
}
