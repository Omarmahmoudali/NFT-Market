import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.image, required this.angle})
      : super(key: key);

  final String image;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: 150.w,
        height: 198.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color(0xffFFFFFF).withOpacity(0.52), width: 2),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(20, 20, 20, 0.35),
            )
          ],
          color: const Color(0xffE5E5E5),
          gradient: LinearGradient(
            colors: [
              const Color(0xffFFFFFF).withOpacity(0.52),
              const Color(0xffFFFFFF).withOpacity(0.0),
              const Color(0xffFFFFFF).withOpacity(0.51),
            ],
          ),
        ),
      ),
    );
  }
}
