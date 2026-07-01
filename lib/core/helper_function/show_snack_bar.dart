import 'package:flutter/material.dart';

void showSnackBar(
   BuildContext context,{
    required String message,
     bool isSuccess  = true,
  }
){
ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isSuccess ==true?Colors.green:Colors.red,
      behavior: SnackBarBehavior.floating,
    ),
  );

}