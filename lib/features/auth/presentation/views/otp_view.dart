import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custom_button.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custome_appbar.dart';
import 'package:fruit_ecommerce_app/core/routes/routes.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}
final TextEditingController pinputController=TextEditingController();
final _fromkey4=GlobalKey<FormState>();


class _OtpViewState extends State<OtpView> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pinputController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(screenName: 'التحقق من الرمز'),
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _fromkey4,
          child: Column(
            
            children: [
              SizedBox(height: 16.h),
              Text(
                'أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي Maxxx@email.com',
                style: TextStyle(
                  fontSize: 16.r,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff616A6B)
                ),
              ),
              SizedBox(height: 30.h),
              Directionality(
                 textDirection: TextDirection.ltr,
                child: Pinput(
                  controller:pinputController ,
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return ' failed is required';
                    }
                    
                  },
          
          
                  focusedPinTheme:PinTheme(
                    height: 60.h,
                    width: 64.w,
                    padding: EdgeInsets.all(8.r),
                    textStyle: TextStyle(
                      
                      color: Color(0xffF4A91F),
                    fontSize: 23.r,
                    fontWeight: FontWeight.w700
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Color(0xffF9FAFA),
                      border: Border.all(color: Color(0xffF4A91F))
                    )
                  ),
                  defaultPinTheme: PinTheme(
                    height: 60.h,
                    width: 64.w,
                    padding: EdgeInsets.all(8.r),
                    textStyle: TextStyle(
                      
                      color: Color(0xff0C0D0D),
                    fontSize: 23.r,
                    fontWeight: FontWeight.w700
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Color(0xffF9FAFA),
                      border: Border.all(color: Color(0xffE6E9EA))
                    )
                  ),
                  separatorBuilder: (index) => SizedBox(width: 15.w,),
                ),
              ),
              SizedBox(height: 30.h,),
              CustomButton(text: 'تحقق من الرمز',
              onTap: () {
                if(_fromkey4.currentState!.validate()){
                  Navigator.pushNamed(context, AppRoutes.newPasswordView);
                }
                return null;

              },
              )
            ],
          ),
        ),
      ),
    );
  }
}