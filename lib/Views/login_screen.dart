import 'package:dating_app/Core/Config/size_config.dart';
import 'package:dating_app/Resorces/app_assets.dart';
import 'package:dating_app/Resorces/app_color.dart';
import 'package:dating_app/Resorces/app_style.dart';
import 'package:dating_app/Views/bottom_app_bar_screen.dart';
import 'package:dating_app/Widgets/common_button.dart';
import 'package:dating_app/Widgets/custom_textfields.dart';
import 'package:dating_app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  LoginController loginController = Get.put(LoginController());

  bool _passwordVisible = true;

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  vsBox4,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign In",
                      style: AppStyles.of(context).figtreeBold.copyWith(
                          color: AppColors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  vsBox1,
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has",
                    style: AppStyles.of(context).figtreeRegular.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackSub),
                  ),
                  vsBox3,
                  CustomTextField(
                    controller: controller.userNameController,
                    fillColor: AppColors.textFieldBgColor,
                    borderColor: AppColors.fillColor,
                    obscureText: false,
                    readOnly: false,
                    cursorColor: AppColors.black,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                    hintStyle: AppStyles.of(context).figtreeRegular.copyWith(
                        fontSize: 14,
                        color: AppColors.hedingTextColor.withOpacity(.4)),
                    textColor: AppColors.inputTextColor,
                    // validator: (value) => _emailErrorText,
                    // onChanged: _validateEmail,
                    // errorText: _emailErrorText,
                  ),
                  vsBox2,
                  CustomTextField(
                      cursorColor: AppColors.black,
                      textColor: AppColors.inputTextColor,
                      hintStyle: AppStyles.of(context).figtreeRegular.copyWith(
                          fontSize: 14,
                          color: AppColors.hedingTextColor.withOpacity(.4)),
                      borderColor: AppColors.fillColor,
                      controller: controller.passwordController,
                      obscureText: _passwordVisible,
                      fillColor: AppColors.textFieldBgColor,
                      hintText: "Password",
                      maxLines: 1,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.hedingTextColor.withOpacity(0.4),
                        ),
                      ),
                      validator: (value) => _passwordinErrorText,
                      onChanged: _validatePassword,
                      errorText: _passwordinErrorText,
                      readOnly: false),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          // Get.to(() => const ForgotPasswordScreenView(),
                          //     transition: Transition.circularReveal,
                          //     duration: const Duration(milliseconds: 1000));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: AppStyles.of(context).figtreeBold.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              letterSpacing: .5),
                        )),
                  ),
                  vsBox2,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CommonButton(
                      bgColor: AppColors.orange,
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        controller.loginWithEmail(context);
                        FocusScope.of(context).unfocus();
                        // await Future.delayed(const Duration(seconds: 3))
                        //     .then((value) {
                        //   setState(() {
                        //     Get.to(() => const BottomAppBr(),
                        //         transition: Transition.circularReveal,
                        //         duration: const Duration(milliseconds: 1000));
                        //     isLoading = false;
                        //   });
                        // });
                      },
                      btWidget: controller.isLoading
                          ? Image.asset(AppAssets.loaderGif)
                          : Text(
                              "Sing In",
                              style: AppStyles.of(context).figtreeBold.copyWith(
                                  color: AppColors.white, fontSize: 18),
                            ),
                    ),
                  ),
                  vsBox3,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.35,
                        height: 1,
                        color: AppColors.dividerColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "OR",
                          style: AppStyles.of(context).figtreeRegular.copyWith(
                              fontSize: 14,
                              color: AppColors.hedingTextColor.withOpacity(.8)),
                        ),
                      ),
                      Container(
                        width: size.width * 0.35,
                        height: 1,
                        color: AppColors.dividerColor,
                      ),
                    ],
                  ),
                  vsBox2,
                  Text(
                    "Continue With",
                    style: AppStyles.of(context).figtreeRegular.copyWith(
                        color: AppColors.grey1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  vsBox2,
                  vsBox5,
                  vsBox2
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
  //// Email validation

  String? _emailErrorText;

  void _validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      setState(() {
        _emailErrorText = 'Email is required';
      });
    } else if (!regExp.hasMatch(value)) {
      setState(() {
        _emailErrorText = 'Invalid email';
      });
    } else {
      setState(() {
        _emailErrorText = null;
      });
    }
  }

  /// Password Validation
  String? _passwordinErrorText;

  void _validatePassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _passwordinErrorText = '(Password is required)';
      });
    } else if (value.length <= 7) {
      setState(() {
        _passwordinErrorText = "It must be an 8 character password.";
      });
    } else {
      setState(() {
        _passwordinErrorText = null;
      });
    }
  }

  /// Type of Logins

  GestureDetector loginContainers(String logo, void Function()? onTap) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            color: AppColors.white,
            // borderRadius: BorderRadius.circular(18),
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: AppColors.borderColor),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 8,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              child: Image.asset(
                logo,
                alignment: Alignment.center,
              ),
            ),
          ),
        ));
  }
}
