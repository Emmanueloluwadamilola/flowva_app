import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flowva_app/core/extensions/navigation.dart';
import 'package:flowva_app/core/resources/colors.dart';
import 'package:flowva_app/core/resources/drawables.dart';
import 'package:flowva_app/core/widgets/bottom_modal_drag.dart';
import 'package:flowva_app/core/widgets/button.dart';
import 'package:flowva_app/core/widgets/input_field.dart';
import 'package:flowva_app/core/widgets/svg_image.dart';
import 'package:flowva_app/core/widgets/text_widgets.dart';
import 'package:flowva_app/features/auth/manager/auth_provider.dart';
import 'package:flowva_app/features/auth/screens/forgot_password.dart';
import 'package:flowva_app/features/auth/screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
               fit: BoxFit.fitWidth,
              image: AssetImage(imgLoginBackground)),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
                right: 20,
                left: 20,
                bottom: 40,
              ),
              decoration: BoxDecoration(
                color: white,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Consumer<AuthProvider>(
                builder: (context, provider, _) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Center(child: BottomModalDragWidget()),
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const LargeText(
                                    text: 'Continue to log in',
                                    fontSize: 20,
                                  ),
                                  const SizedBox(height: 2),
                                  const SmallText(
                                    text: 'Let’s get you started.',
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            InputField(
                              validationColor: Colors.red,
                              validationMessage: provider.emailError,
                              onChanged: (value) {
                                provider.setEmail(value);
                              },
                              textInputType: TextInputType.emailAddress,
                              controller: provider.emailControlloer,
                              placeholder: 'Email address',
                              label: '',
                            ),
                            const SizedBox(height: 4),
                            InputField(
                              validationColor: Colors.red,
                              validationMessage: provider.passwordError,
                              onChanged: (value) {
                                provider.setPassword(value);
                              },
                              textInputType: TextInputType.visiblePassword,
                              controller: provider.passwordControlloer,
                              placeholder: 'Password',
                              label: '',
                              password: true,
                            ),
                            const SizedBox(height: 8),
                            Button(
                              title: provider.isLoading
                                  ? 'Loading...'
                                  : 'Continue',
                              onPressed: provider.isLoading
                                  ? () {}
                                  : () => provider.signIn(context),
                              buttonColor: Color(0xFF111111),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  context.pushNamed(ForgotPasswordScreen.id);
                                },
                                child: LargeText(
                                  text: 'Forgot your password',
                                  textDecoration: TextDecoration.underline,
                                  fontColor: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.center,
                              child: MediumText(text: 'OR'),
                            ),
                            const SizedBox(height: 15),
                            RowButton(
                              asset: icGoogle,
                              title: 'Continue with Google',
                              onPress: () => provider.signInWithGoogle(context),
                            ),
                            const SizedBox(height: 8),
                            RowButton(
                              asset: icApple,
                              title: 'Continue with Apple',
                              onPress: () => provider.signInWithApple(context),
                            ),
                            const SizedBox(height: 20),
                            Text.rich(
                              TextSpan(
                                text: 'Don’t have an account?',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'manrope',
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Sign up',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'manrope',
                                      color: primaryColor,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushNamedReplacement(
                                          SignUpScreen.id,
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                            MediumText(
                              text:
                                  'By continuing you agree to the Rules and Policy',
                              fontSize: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RowButton extends StatelessWidget {
  const RowButton({
    super.key,
    required this.asset,
    required this.title,
    required this.onPress,
  });
  final String asset;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Color(0x261C636F)),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: 52,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: .3),
                offset: Offset(1, 2),
              ),
              BoxShadow(
                color: Colors.grey.withValues(alpha: .3),
                offset: Offset(-1, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgImage(asset: asset),
              MediumText(
                text: title,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
