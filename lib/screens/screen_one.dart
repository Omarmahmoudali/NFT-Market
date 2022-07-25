import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/screens/screen_two.dart';
import 'package:testapp/widgets/image_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final Shader gradient = LinearGradient(
    colors: <Color>[
      const Color(0xffFFFFFF).withOpacity(0.85),
      const Color(0xffFFFFFF).withOpacity(0.92),
      const Color(0xffFFFFFF).withOpacity(0.47),
    ],
    // tileMode: TileMode.clamp,
    // begin: Alignment.topLeft,
    // end: Alignment.bottomRight
  ).createShader(
    const Rect.fromLTWH(0, 0, 320, 40),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffE5E5E5),
        gradient: LinearGradient(
          colors: [
            const Color(0xff110F2F).withOpacity(1.0),
            const Color(0xff221F53).withOpacity(1.0)
          ],
          transform: const GradientRotation(pi),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.h),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 60.w,
                    top: 70.h,
                    child: const ImageCard(
                      image: 'assets/images/image1.png',
                      angle: pi / 6,
                    ),
                  ),
                  const Center(
                    child: ImageCard(
                      image: 'assets/images/image1.png',
                      angle: 0,
                    ),
                  ),
                  Positioned(
                    left: 60.w,
                    top: 70.h,
                    child: const ImageCard(
                      image: 'assets/images/image1.png',
                      angle: -pi / 6,
                    ),
                  ),
                ],
              ),
            ),
            150.verticalSpace,
            Text(
              'Find your\n Best NFT\n Market',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 50.sp,
                  fontFamily: 'Clash Display',
                  foreground: Paint()..shader = gradient),
            ),
            52.verticalSpace,
            // Stack(
            //   clipBehavior: Clip.none,
            //   children: [
            //     CustomPaint(
            //       size: Size(
            //           300.w,
            //           (250.w * 0.5)
            //               .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //       painter: RPSCustomPainter(),
            //     ),
            //     Positioned(
            //         top: 80.h,
            //         left: 130.w,
            //         child: Text(
            //           'Start',
            //           style: TextStyle(fontSize: 24.sp, color: Colors.white),
            //         ))
            //   ],
            // ),

            InkWell(
              child: SvgPicture.asset('assets/images/startbtn.svg'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ScreenTwo()));
              },
            ),
            30.verticalSpace,
          ],
        ),
      ),
    ));
  }
}
