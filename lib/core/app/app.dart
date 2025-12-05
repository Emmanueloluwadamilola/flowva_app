import 'package:flowva_app/features/auth/screens/forgot_password.dart';
import 'package:flowva_app/features/auth/screens/sign_up_screen.dart';
import 'package:flowva_app/features/auth/screens/login_screen.dart';
import 'package:flowva_app/features/home/screens/home_screen.dart';
import 'package:flowva_app/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        title: 'Flowva',
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        builder: (context, child) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: child!,
            ),
          );
        },
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
