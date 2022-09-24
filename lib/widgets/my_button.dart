import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  String label;
  void Function()? onTab;

  MyButton({
    Key? key,
    required this.label,
    required this.onTab,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTab,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
