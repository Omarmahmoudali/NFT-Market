import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavFrame extends StatelessWidget {
  final Widget child;
  const FavFrame({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.26),
        borderRadius: BorderRadius.circular(24),
      ),
      child: child,
    );
  }
}
