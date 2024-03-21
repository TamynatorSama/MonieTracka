import 'package:flutter/material.dart';
import 'package:monie_tracka/shared/utils/app_theme.dart';

class CustomButton extends StatefulWidget {
  final Function()? onTap;
  final double? maxWidth;
  final String text;
  const CustomButton(
      {super.key, this.onTap, required this.text, this.maxWidth});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: widget.maxWidth ?? double.maxFinite),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: widget.onTap,
          splashColor: const Color.fromARGB(46, 255, 255, 255),
          child: Ink(
              width: double.maxFinite,
              height: 55,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: AppTheme.btnColor,
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: AppTheme.buttonStyle,
                ),
              )),
        ),
      ),
    );
  }
}
