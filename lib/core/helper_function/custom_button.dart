
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, this.onTap,
  });
final String text;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
       height: 54.h,
       decoration: BoxDecoration(
         color: Color(0xff1B5E37),
         borderRadius: BorderRadius.circular(16.r)
      
       ),
       child: Center(child: Text(
         text,
         style: TextStyle(
           color: Color(0xffFFFFFF),
           fontSize: 16.r,
           fontWeight: FontWeight.w700
      
         ),
       
       ),),
      ),
    );
  }
}