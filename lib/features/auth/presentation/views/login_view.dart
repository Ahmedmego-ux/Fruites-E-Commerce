import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custom_button.dart';
import 'package:fruit_ecommerce_app/core/routes/routes.dart';
import 'package:fruit_ecommerce_app/core/string/app_string.dart';
import '../../../../core/helper_function/custom_text_form_field.dart';
import '../../../../core/helper_function/custome_appbar.dart';
import '../widgets/login_by.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();


class _LoginViewState extends State<LoginView> {
  bool isPasswordHide = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: CustomAppBar(screenName: 'تسجيل دخول'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  CustomFormTextFormFeild(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email is required";
                      }

                      final email = value.trim();

                      if (!email.contains('@') || !email.contains('.')) {
                        return "Enter a valid email";
                      }

                      return null;
                    },
                    controller: emailController,
                    hintText: 'البريد الالكتروني ',
                    sufixIcon: Icons.email,
                    isPassword: false,
                  ),
                  SizedBox(height: 16.h),
                  CustomFormTextFormFeild(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }

                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }

                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Must contain at least one uppercase letter';
                      }

                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Must contain at least one lowercase letter';
                      }

                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Must contain at least one number';
                      }

                      return null;
                    },
                    controller: passwordController,
                    hintText: 'كلمة المرور',
                    sufixIcon: isPasswordHide == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    isPassword: isPasswordHide,
                    ontapIcon: () {
                      setState(() {
                        isPasswordHide = !isPasswordHide;
                      });
                    },
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, AppRoutes.forgetPasswordView),
                        child: Text(
                          'نسيت كلمة المرور؟',
                        
                          style: TextStyle(
                            fontSize: 13.r,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2D9F5D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 33.h),

                  CustomButton(
                    text: 'تسجيل دخول',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),

                  SizedBox(height: 33.h),
                  RichText(
                    text: TextSpan(
                      text: 'لا تمتلك حساب؟ ',
                      style: TextStyle(
                        color: Color(0xff949D9E),
                        fontSize: 16.r,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          
                         recognizer: TapGestureRecognizer()..onTap =()=>Navigator.pushNamed(context, AppRoutes.singUpView),
                          text: 'قم بانشاء حساب',
                          style: TextStyle(
                            color: Color(0xff1B5E37),
                            fontSize: 16.r,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 33.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xffDDDFDF),
                        ),
                      ),
                      Text(
                        'او',
                        style: TextStyle(
                          fontSize: 16.r,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0C0D0D),
                        ),
                      ),
                      SizedBox(
                        width: 150.w,
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xffDDDFDF),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  LoginBy(
                    logo: AppString.googleIcon,
                    text: 'تسجيل بواسطة جوجل',
                  ),
                  SizedBox(height: 16.h),
                  LoginBy(logo: AppString.appleIcon, text: 'تسجيل بواسطة أبل'),
                  SizedBox(height: 16.h),
                  LoginBy(
                    logo: AppString.facebookIcon,
                    text: 'تسجيل بواسطة فيسبوك',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
