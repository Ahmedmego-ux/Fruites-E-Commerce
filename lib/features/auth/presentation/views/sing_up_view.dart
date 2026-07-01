import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custome_appbar.dart';
import 'package:fruit_ecommerce_app/core/helper_function/show_snack_bar.dart';
import 'package:fruit_ecommerce_app/core/routes/routes.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/manger/creat_new_user/creat_new_user_cubit.dart';

import '../../../../core/helper_function/custom_button.dart';
import '../../../../core/helper_function/custom_text_form_field.dart';

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  State<SingUpView> createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey2 = GlobalKey<FormState>();
  bool isPasswordHide = false;
  bool isConfirmPasswordHide = false;
  bool isCheck = false;
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
              child: BlocConsumer<CreatNewUserCubit, CreatNewUserState>(
                listener: (context, state) {
                  if (state is CreatNewUserSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account created successfully"),
                      ),
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.homeView,
                      (route) => false,
                    );
                  }
                  if (state is CreatNewUserFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errMessage)));
                  }
                },
                builder: (context, state) {
                  if (state is CreatNewUserLoading) {
                   return  SizedBox(
                      height: 600.h, 
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return Column(
                    children: [
                      SizedBox(height: 24.h),

                      CustomFormTextFormFeild(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Full name is required";
                          }

                          final fullName = value.trim();

                          // لازم يكون الاسم على الأقل كلمتين
                          if (fullName.split(' ').length < 2) {
                            return "Enter your full name";
                          }

                          // يسمح بالحروف والمسافات فقط
                          final regex = RegExp(r"^[a-zA-Z\u0600-\u06FF\s]+$");

                          if (!regex.hasMatch(fullName)) {
                            return "Name can only contain letters";
                          }

                          return null;
                        },
                        controller: nameController,
                        hintText: "الاسم كامل",
                        sufixIcon: Icons.account_circle_outlined,
                        isPassword: false,
                      ),

                      SizedBox(height: 16.h),
                      CustomFormTextFormFeild(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Email is required";
                          }

                          final email = value.trim();

                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );

                          if (!emailRegex.hasMatch(email)) {
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
                        sufixIcon: isConfirmPasswordHide == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        isPassword: isConfirmPasswordHide,
                        ontapIcon: () {
                          setState(() {
                            isConfirmPasswordHide = !isConfirmPasswordHide;
                          });
                        },
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
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
                            if (!isCheck) {
                             showSnackBar(context, message: "يجب الموافقة على الشروط والأحكام",isSuccess: false);
                            } else {
                              context.read<CreatNewUserCubit>().creatUser(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                name: nameController.text.trim(),
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
