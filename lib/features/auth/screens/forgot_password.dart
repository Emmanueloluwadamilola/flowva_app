import 'package:flowva_app/core/resources/colors.dart';
import 'package:flowva_app/core/resources/drawables.dart';
import 'package:flowva_app/core/widgets/bottom_modal_drag.dart';
import 'package:flowva_app/core/widgets/button.dart';
import 'package:flowva_app/core/widgets/input_field.dart';
import 'package:flowva_app/core/widgets/svg_image.dart';
import 'package:flowva_app/core/widgets/text_widgets.dart';
import 'package:flowva_app/features/auth/manager/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const id = 'forgot-password-screen';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imgLoginBackground),
            ),
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
                                    text: 'Enter your email',
                                    fontSize: 20,
                                  ),
                                  const SizedBox(height: 2),
                                  const SmallText(
                                    text:
                                        'Enter your email and we will send you a code',
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            InputField(
                              fieldFocusNode: _focusNode,
                              controller: provider.emailControlloer,
                              placeholder: 'Enter your email',
                              label: '',
                            ),
                            const SizedBox(height: 4),

                            Button(
                              title: provider.isLoading
                                  ? 'Loading...'
                                  : 'Continue',
                              onPressed: provider.isLoading
                                  ? () {}
                                  : () => provider.forgotPassword(context),
                              buttonColor: Color(0xFF111111),
                            ),

                            const SizedBox(height: 15),
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
