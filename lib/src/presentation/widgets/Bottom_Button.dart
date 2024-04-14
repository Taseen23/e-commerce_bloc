import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key,
      this.backgroundColor,
      this.textColor,
      required this.buttonText,
      this.onTap,
      this.buttonchild});
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final String buttonText;
  final Widget? buttonchild;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color:
            backgroundColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
        height: 80.h,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: buttonchild ??
              Text(
                buttonText,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color:
                        textColor ?? Theme.of(context).colorScheme.onSecondary),
              ),
        ),
        // width: 200,
      ),
    );
  }
}
