import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custome_appbar.dart';
import 'package:fruit_ecommerce_app/core/routes/routes.dart';

import '../../../../core/helper_function/custom_button.dart';
import '../../../../core/helper_function/custom_text_form_field.dart';

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  State<SingUpView> createState() => _SingUpViewState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

class _SingUpViewState extends State<SingUpView> {
  final _formKey2 = GlobalKey<FormState>();
  bool isPasswordHide = false;
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: CustomAppBar(screenName: 'حساب جديد'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey2,
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
                  CustomFormTextFormFeild(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }

                      if (value.trim() != passwordController.text.trim()) {
                        return "Passwords do not match";
                      }

                      return null;
                    },
                    controller: confirmPasswordController,
                    hintText: 'تاكيد كلمة المرور',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        activeColor: Color(0xff1B5E37),
                        value: isCheck,
                        onChanged: (v) {
                          setState(() {
                            isCheck = v!;
                          });
                        },
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Text(
                          'من خلال إنشاء حساب ، فإنك توافق على الشروط والأحكام الخاصة بنا',

                          style: TextStyle(
                            color: Color(0xff616A6B),
                            fontSize: 13.r,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 33.h),

                  CustomButton(
                    text: 'تسجيل دخول',
                    onTap: () {
                      if (_formKey2.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);

                        if (!isCheck) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("يجب الموافقة على الشروط والأحكام"),
                            ),
                          );
                        }
                      }
                    },
                  ),

                  SizedBox(height: 33.h),
                  RichText(
                    text: TextSpan(
                      text: 'تمتلك حساب بالفعل؟ ',
                      style: TextStyle(
                        color: Color(0xff949D9E),
                        fontSize: 16.r,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushNamed(
                              context,
                              AppRoutes.loginView,
                            ),
                          text: 'تسجيل دخول',
                          style: TextStyle(
                            color: Color(0xff1B5E37),
                            fontSize: 16.r,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
