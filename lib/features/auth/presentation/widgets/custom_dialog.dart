
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/string/app_string.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r)
      )
      ,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
      child: Container(
        height: 266.h,
        width: 342.w,
        child: SvgPicture.asset(AppString.changePasswordIcon,
       width: 162.w,height: 166.h,
       fit: BoxFit.none,
       ),
      
      ),
    );
  }
}