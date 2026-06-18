import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/string/app_string.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            width: double.infinity,
            alignment: Alignment.topCenter,
            AppString.background1,),
            Positioned(
              top: 39.h,
              left: 333.w,
              child: Text('تخط',
            style:TextStyle(
              color: Color(0xff949D9E),
              fontSize: 13,
              fontWeight: FontWeight.w400
              ) ,
            )),

            Positioned(
               top: 136.5,
        left: 29,
        right: 0,
              child: Padding(
                padding:  EdgeInsets.all(8.0.r),
                child: Column(
                  children: [
                    SvgPicture.asset(AppString.fruitBasket),
                    SizedBox(height: 64.h,),
                    RichText(text: TextSpan(
                      text:  'مرحبا بك في ',
                      style: TextStyle(
                        fontSize: 23.r ,
                        fontWeight: FontWeight.w700,
                        
                        color: Color(0xff0C0D0D)
                      ),
                      children: [
                        TextSpan(
                      text: 'Fruit',
                      style: TextStyle(
                        fontSize: 23.r ,
                        fontWeight: FontWeight.w700,
                        
                        color:Color(0xff1B5E37) 
                      ),),
                        TextSpan(
                          text:'HUB ',
                      style: TextStyle(
                        fontSize: 23.r ,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 229, 119, 9)
                      ),
                        )

                      ]
                    ) ),
                    SizedBox(height: 24.h,),
                    Text(
                      textAlign: TextAlign.center,
                      'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.'),
                  
                     
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}