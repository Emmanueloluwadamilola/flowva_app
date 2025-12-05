import 'package:flowva_app/core/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.title,
      this.isLoading = false,
      required this.onPressed,
      this.isEnabled = true,
      this.width,
      this.height,
      this.isIconBtn = false,
      this.textSize,
      this.borderRadius,
      this.buttonColor,
      this.textColor,
      this.iconWidget});

  final String title;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isEnabled;
  final bool isIconBtn;
  final Widget? iconWidget;
  final double? textSize;
  final double? borderRadius;
  final Color? buttonColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return 
    
    
    
    Container(
      padding: EdgeInsets.all(5),
      height: height ?? 60,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Color(0x269013FE))
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(buttonColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 32)))),
        onPressed: (isEnabled && !isLoading) ? onPressed : null,
        child: isLoading == true
            ? CupertinoActivityIndicator(
                color: textColor ?? textLight,
              )
            : isIconBtn
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      iconWidget ?? const SizedBox(),
                      Text(
                        textScaler: MediaQuery.textScalerOf(context)
                            .clamp(maxScaleFactor: 1),
                        title,
                        style: TextStyle(
                          color: white, fontFamily: 'manrope', fontSize: 16, fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  )
                :  Text(
                        textScaler: MediaQuery.textScalerOf(context)
                            .clamp(maxScaleFactor: 1),
                        title,
                        style: TextStyle(
                          color: white, fontFamily: 'manrope', fontSize: 16, fontWeight: FontWeight.w600
                        ),
                      ),
      ),
    );
  }
}