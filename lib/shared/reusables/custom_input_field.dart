// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monie_tracka/shared/utils/app_theme.dart';
import 'package:monie_tracka/shared/utils/icons.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final bool isPassword;
  final bool showPasswordToggle;
  final Widget? suffixIcon;
  final String label;
  final TextInputType? inputType;
  final String? Function(dynamic)? validator;
  final List<TextInputFormatter>? formatter;
  final Function(String value)? onChange;
  const CustomInputField(
      {super.key,
      required this.controller,
      this.formatter,
      this.isPassword = false,
      this.showPasswordToggle = false,
      this.onChange,
      this.suffixIcon,
      required this.label,
      this.validator,
      this.inputType = TextInputType.text,
      this.decoration = const InputDecoration()});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool obscurePassword = true;
  bool isFocused = false;
  FocusNode focus = FocusNode();
  @override
  void initState() {
    focus.addListener(updateIsFocused);
    super.initState();
  }

  updateIsFocused() => setState(() => isFocused = !isFocused);

  void updatePassword() => setState(() => obscurePassword = !obscurePassword);

  @override
  void dispose() {
    focus.removeListener(updateIsFocused);
    focus.dispose();
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.label,
          style: AppTheme.headerStyle
              .copyWith(fontSize: 14, color: const Color(0xff515151)),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
            focusNode: focus,
            controller: widget.controller,
            keyboardType: widget.inputType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: widget.isPassword ? obscurePassword : false,
            obscuringCharacter: "●",
            cursorColor: Colors.black,
            onChanged: widget.onChange,
            inputFormatters: widget.formatter,
            validator: widget.validator ??
                (string) {
                  if (string.toString().isEmpty) {
                    return "${widget.label} cannot be empty";
                  }
                  return null;
                },
            decoration: widget.decoration.copyWith(
                filled: true,
                fillColor: isFocused ? Colors.white : const Color(0xffECECEC),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: (widget.isPassword && obscurePassword)?20: 16),
                suffixIcon: widget.suffixIcon != null || (widget.isPassword && widget.showPasswordToggle)
                    ? Container(
                        constraints: const BoxConstraints(maxWidth: 70),
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          width: 20,
                          child: widget.isPassword? InkWell(
                            onTap: updatePassword,
                            child: SvgPicture.asset(obscurePassword?CustomIcons.eyeSlash:CustomIcons.eyeOpen),
                          ) : widget.suffixIcon,
                        ),
                      )
                    : null,
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 216, 55, 55))),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 216, 55, 55))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 2, color: Color(0xffECECEC))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(width: 2, color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(width: 2, color: Color(0xffECECEC)))),
            style: AppTheme.bodyTextBold
                .copyWith(fontSize: (widget.isPassword && obscurePassword)?10: 16, color: Colors.black,letterSpacing: (widget.isPassword && obscurePassword)?10:null))
      ],
    );
  }
}
