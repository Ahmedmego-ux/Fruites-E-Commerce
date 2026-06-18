import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/string/app_string.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OnboardingTow extends StatelessWidget {
  const OnboardingTow({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            width: double.infinity,
            alignment: Alignment.topCenter,
            AppString.background2,),

            Positioned(
               top: 136.5,
        left: 29,
        right: 0,
              child: Padding(
                padding:  EdgeInsets.all(8.0.r),
                child: Column(
                  children: [
                    SvgPicture.asset(AppString.pineappleCuate),
                    SizedBox(height: 64.h,),
                    Text('ابحث وتسوق', style: TextStyle(
                        fontSize: 23.r ,
                        fontWeight: FontWeight.w700,
                        
                        color: Color(0xff0C0D0D)
                      ),),
                  
                    SizedBox(height: 24.h,),
                    Text(
                      textAlign: TextAlign.center,
'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية'  
                
                    )    
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}