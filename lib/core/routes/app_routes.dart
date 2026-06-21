import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/views/sing_up_view.dart';
import 'package:fruit_ecommerce_app/features/onboard/presentation/views/onboarding_view.dart';
import 'package:fruit_ecommerce_app/features/splash/presentation/views/splash_view.dart';

import 'routes.dart';


  Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.splashScreen:
      return MaterialPageRoute(builder: (_)=>SplashView());
      case AppRoutes.onboarding:
      return MaterialPageRoute(builder: (_)=>OnboardingView());
       case AppRoutes.loginView:
      return MaterialPageRoute(builder: (_)=>LoginView());
       case AppRoutes.singUpView:
      return MaterialPageRoute(builder: (_)=>SingUpView());

       default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          ),
        );
    }
  }
