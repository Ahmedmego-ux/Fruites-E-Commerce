import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custom_button.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custom_text_form_field.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custome_appbar.dart';
import 'package:fruit_ecommerce_app/core/routes/routes.dart';

class ForgetPasswordView extends StatefulWidget {
   ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController phoneController=TextEditingController();

final  _formkey3=GlobalKey<FormState>();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(screenName: 'نسيان كلمة المرور'),
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding:  EdgeInsets.all(16.r),
        child: Form(
          key: _formkey3,
          child: Column(
            children: [
              Text('لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
              style: TextStyle(
                fontSize: 16.r,
                fontWeight: FontWeight.w600,
                color: Color(0xff616A6B)
              ),
              ),
              SizedBox(height: 30.h,),
              CustomFormTextFormFeild(
                controller: phoneController,
                hintText: "رقم الهاتف",
                 sufixIcon: Icons.phone, 
                 keyboardType: TextInputType.phone,
                 validator: (value) {
                  if(value==null||value.isEmpty){
                    return 'field is required';
          
                  }
                  if(value.length!=11){
                    return "Phone Number must be 11 number";
                  }
                  if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value)) {
                 return 'Enter a valid Egyptian phone number';
                  }
                   return null;
                 },
                  ),
                   SizedBox(height: 30.h,),
                   CustomButton(text: 'ارسال الكود ',
                   onTap: () {
                     if(_formkey3.currentState!.validate()){
                      print(phoneController.text);
                      Navigator.pushNamed(context, AppRoutes.otpView);
                     }
                   },
                   )

            ],
          ),
        ),
      ),

    );
  }
}