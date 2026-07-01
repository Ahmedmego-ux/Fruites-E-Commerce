import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce_app/core/services/get_it_service.dart';
import 'package:fruit_ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/manger/creat_new_user/creat_new_user_cubit.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/manger/login/log_in_cubit.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/views/new_password_view.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/views/otp_view.dart';
import 'package:fruit_ecommerce_app/features/auth/presentation/views/sing_up_view.dart';
import 'package:fruit_ecommerce_app/features/home/presentation/view/home_view.dart';
import 'package:fruit_ecommerce_app/features/onboard/presentation/views/onboarding_view.dart';
import 'package:fruit_ecommerce_app/features/splash/presentation/views/splash_view.dart';

import 'routes.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashScreen:
      return MaterialPageRoute(builder: (_) => SplashView());
    case AppRoutes.onboarding:
      return MaterialPageRoute(builder: (_) => OnboardingView());
    case AppRoutes.loginView:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<LogInCubit>(),
          child: LoginView(),
        ),
      );
    case AppRoutes.singUpView:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<CreatNewUserCubit>(),
          child: SingUpView(),
        ),
      );
    case AppRoutes.forgetPasswordView:
      return MaterialPageRoute(builder: (_) => ForgetPasswordView());
    case AppRoutes.otpView:
      return MaterialPageRoute(builder: (_) => OtpView());
    case AppRoutes.newPasswordView:
      return MaterialPageRoute(builder: (_) => NewPasswordView());
    case AppRoutes.homeView:
      return MaterialPageRoute(builder: (_) => HomeView());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
