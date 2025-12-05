import 'package:flowva_app/core/resources/colors.dart';
import 'package:flutter/widgets.dart';

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.text, this.fontSize, this.fontWeight, this.fontColor});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
    final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontFamily: 'manrope',
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: fontColor ?? textLight
    ),);
  }
}

class MediumText extends StatelessWidget {
  const MediumText({super.key, required this.text, this.fontSize, this.fontColor, this.fontWeight});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
    final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontFamily: 'manrope',
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color:fontColor ?? textMedium
    ),);
  }
}

class LargeText extends StatelessWidget {
  const LargeText({super.key, required this.text, this.fontSize,this.fontColor, this.fontWeight,this.textAlign, this.textDecoration});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
    final Color? fontColor;
    final TextDecoration? textDecoration;
    final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontFamily: 'manrope',
      fontSize: fontSize ?? 15,
      fontWeight: fontWeight ?? FontWeight.w600,
       color:fontColor ?? textMedium,
       decoration: textDecoration
    ),
    textAlign: textAlign,
    );
  }
}

class BoldText extends StatelessWidget {
  const BoldText({super.key, required this.text, this.fontSize, this.fontWeight, this.fontColor, this.textAlign});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
    final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontFamily: 'manrope',
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w700,
       color: fontColor ?? textMedium
    ),
     textAlign: textAlign,
    );
  }
}


