import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/helper_function/custom_button.dart';
import 'package:fruit_ecommerce_app/core/routes/routes.dart';
import 'package:fruit_ecommerce_app/features/onboard/presentation/widgets/onboarding_one.dart';

import '../widgets/onboarding_tow.dart';

class OnboardingView extends StatefulWidget {
   OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
final PageController controller=PageController();
 int currentpage =0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) => setState(() {
                currentpage=value;
              }),
              children: [
            OnboardingOne(),
            OnboardingTow()
              ],
              
              
            ),
          ),

           DotsIndicator(
                        position: currentpage.toDouble(),
                        animate: true
                        ,
                        dotsCount: 2,
                      decorator: DotsDecorator(
                       activeColor:  Color(0xff1B5E37)
                      ),
                     
                      ),
                      SizedBox(
                        height: 150.h,

       child:   currentpage >=1?  Padding(
             padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 48.h),
             child: InkWell(
              onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.loginView),
               child: CustomButton(text: 'ابدا الان',),
             ),
           ):SizedBox())
        ],
      ),
      

    );
  }
}
