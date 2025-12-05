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
    return      AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              // systemNavigationBarColor: primaryColor,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:  Brightness.dark
                ,
            ),
         
            //     ? SystemUiOverlayStyle.dark
            //     : SystemUiOverlayStyle.light,
            child: MaterialApp(
              title: 'Flowva',
            
              // navigatorKey: navigator,
              // navigatorObservers: [routeObserver],
              debugShowCheckedModeBanner: false,
             initialRoute: SplashScreen.id,
           routes: {SplashScreen.id: (context) => SplashScreen(), 
           LoginScreen.id : (context) => LoginScreen(),
           SignUpScreen.id: (context) => SignUpScreen(),
           ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
           HomeScreen.id: (context) => HomeScreen()
           },
            ),
          );
      ;
  }
}