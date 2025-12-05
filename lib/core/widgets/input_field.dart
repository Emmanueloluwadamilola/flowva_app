import 'package:flowva_app/core/resources/colors.dart';
import 'package:flowva_app/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.label,
    this.isPhone = false,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.formatter,
    this.maxLines = 1,
    this.minLines = 1,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = true,
    this.suffix,
    this.onTap,
    this.prefix,
    this.maxLength,
    this.validationColor = Colors.transparent,
    this.fontSize = 14,
    this.height = 50,
  });
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String? validationMessage;
  final Function? enterPressed;
  final bool smallVersion;
  final FocusNode? fieldFocusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? formatter;
  final int maxLines;
  final int minLines;
  final Widget? suffix;
  final Widget? prefix;
  final Color validationColor;
  final String label;
  final double height;
  final bool isPhone;
  final int? maxLength;
  final double fontSize;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPassword = false;

  @override
  void initState() {
    isPassword = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: Color(0xFFCDCDCD)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  focusNode: widget.fieldFocusNode,
                  cursorColor: textLight,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  onTap: widget.onTap,
                  inputFormatters: widget.formatter ?? [],
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  onEditingComplete: () {
                    if (widget.enterPressed != null) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.enterPressed!();
                    }
                  },
                  obscureText: isPassword,
                  readOnly: widget.isReadOnly,
                  style: TextStyle(
                    fontFamily: 'manrope',
                    fontSize: 14,
                    color: textMedium,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      left: 5,
                      top: 12,
                      bottom: 10,
                    ),
                    hintText: widget.placeholder,
                    counterText: '',
                    border: InputBorder.none,
                    prefixIcon: widget.prefix,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'manrope',
                      fontSize: 12,
                      color: textLight,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(height: 10),
                  widget.suffix ??
                      GestureDetector(
                        onTap: () => setState(() {
                          isPassword = !isPassword;
                        }),
                        child: widget.password
                            ? Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                child: Icon(
                                  isPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: textMedium,
                                  size: 18,
                                ),
                              )
                            : Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                              ),
                      ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        if (widget.validationMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: SmallText(
              text: widget.validationMessage!,
              fontColor: Colors.red,
            ),
          ),
      ],
    );
  }
}
