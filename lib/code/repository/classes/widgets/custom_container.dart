import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.w,
      required this.h,
      this.child,
      this.onTap,
      this.text});

  final double w;
  final double h;
  final void Function()? onTap;
  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: InkWell(
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
        ),
        splashColor: Colors.grey,
        onTap: onTap,
        child: Ink(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x264A545C),
                blurRadius: 8,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: SizedBox(
            width: w * 0.8,
            height: h * 0.095,
            child: child,
          ),
        ),
      ),
    );
  }
}
