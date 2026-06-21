
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormTextFormFeild extends StatelessWidget {
   CustomFormTextFormFeild({
    super.key, required this.hintText,
      this.sufixIcon,
       this.isPassword,
       this.ontapIcon, 
       this.validator,
        this.controller, this.keyboardType,
  });
 
final String hintText;
final IconData? sufixIcon;
final bool? isPassword;
final VoidCallback? ontapIcon;
final String? Function(String?)? validator;
final TextEditingController? controller;
final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     keyboardType: keyboardType,
      controller:controller ,
      validator:validator ,
      obscureText: isPassword ??false,
     cursorColor: Color.fromARGB(255, 9, 9, 75),
     cursorHeight: 25,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: ontapIcon, icon:  Icon(sufixIcon,color: Color(0xff949D9E)),
         ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff949D9E),
          fontSize: 13.r,
          fontWeight: FontWeight.w700
        ),
        fillColor: Color(0xffF9FAFA),
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(4.r),
          gapPadding: 8.r,
          borderSide: BorderSide(
            color: Color(0xffE6E9EA),
    
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          gapPadding: 8.r,
          borderSide: BorderSide(
            color: Color(0xffE6E9EA),
    
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          gapPadding: 8.r,
          borderSide: BorderSide(
            color: Color(0xffE6E9EA),
    
          )
        ),
      ),
    );
  }
}
