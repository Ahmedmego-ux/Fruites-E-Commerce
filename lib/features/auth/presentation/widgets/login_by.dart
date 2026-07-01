
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class LoginBy extends StatelessWidget {
   LoginBy({
    super.key, required this.logo, required this.text,this.onTap
  });
final String logo;
final String text;
Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Color(0xffDDDFDF)),
      
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(logo),
            Text(text,style: TextStyle(
              color: Color(0xff0C0D0D),
              fontSize: 16.r,
              fontWeight: FontWeight.w600
            ),),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
