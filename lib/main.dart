import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_ecommerce_app/core/routes/app_routes.dart';
import 'package:fruit_ecommerce_app/core/routes/routes.dart';
import 'package:fruit_ecommerce_app/core/services/get_it_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
    await Firebase.initializeApp();
     await GoogleSignIn.instance.initialize();
    
 setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
     builder: (_, child) {
        return MaterialApp(
          locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute:onGenerateRoute,
      initialRoute:AppRoutes.splashScreen ,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl, child: child??SizedBox()
          );
      },
      
      theme: ThemeData(
      ),
      );
      
      
    });
    }
    }
