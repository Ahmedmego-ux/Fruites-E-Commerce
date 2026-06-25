import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custom_button.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custom_text_form_field.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custome_appbar.dart';
import 'package:fruit_ecommerce_app/core/routes/routes.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/widgets/custom_dialog.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();


class _NewPasswordViewState extends State<NewPasswordView> {
  bool isPasswordHide = false;
  bool isConfirmPasswordHide = false;
  final _formKey5 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(screenName: 'كلمة مرور جديدة'),
        backgroundColor: const Color(0xffFFFFFF),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey5,
            child: Column(
              children: [
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
                SizedBox(height: 30.h),
                CustomButton(
                  text: 'تسجيل دخول',
                  onTap: () {
                    if (_formKey5.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog();
                          
                        },
                      );
                      Future.delayed(Duration(seconds: 2),
                       (){
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, AppRoutes.loginView);

                      });
                     
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
