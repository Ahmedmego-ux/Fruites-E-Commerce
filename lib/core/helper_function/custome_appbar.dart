
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../string/app_string.dart';

class CustomAppBar extends StatelessWidget implements  PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.screenName,
  });
final String screenName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffFFFFFF),
      centerTitle: true,
      title: Text(screenName,
      style: TextStyle(
        color: Color(0xff0C0D0D),
        fontSize: 19.r,
        fontWeight: FontWeight.w700
      ),
      ),
    
      leading: Center(child: SvgPicture.asset(AppString.backIcon,width: 24.r,height: 24.r,)),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);
}