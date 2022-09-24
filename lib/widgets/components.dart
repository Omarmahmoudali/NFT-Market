import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultButton({
  bool isUpperCase = true,
  double? width = double.infinity,
  Color? color = Colors.blue,
  double radius = 10.0,
  required Function onPressed,
  required String text,
}) =>
    Container(
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
      ),
    );

Widget defaultTextButton({
  required Function onPressed,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(text),
    );

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType type,
  Function(String val)? onFieldSubmitted,
  Function(String val)? onChanged,
  Function()? onTap,
  required String? Function(String? value)? validator,
  String? labelText,
  required IconData prefixIcon,
  IconData? suffixIcon,
  bool isPassword = false,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onTap: onTap,
      obscureText: isPassword,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
        ),
        labelText: labelText,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffixIcon,
                ),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey,
      ),
    );

const GET_CATEGORIES = 'categories';
