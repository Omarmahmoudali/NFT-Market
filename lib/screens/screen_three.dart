import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/screens/screen_two.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xffE5E5E5),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(17, 15, 47, 1),
              Color.fromRGBO(34, 31, 83, 1),
            ])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    'assets/images/image3.png',
                    height: 256.0.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 157.h,
                    left: 140.w,
                    child: Image.asset(
                      'assets/images/person.png',
                      width: 110.w,
                      height: 110.h,
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildText('Auction ending in', '05 : 35 : 09'),
                    _buildText('Highest Bid', '290 ETH'),
                  ],
                ),
              ),
              36.verticalSpace,
              Container(
                height: 500.h,
                alignment: Alignment.centerLeft,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 50.h,
                      right: 5.w,
                      child: CarouselImgs(
                        h: 235.0.h,
                        w: 170.w,
                        img: 'assets/images/image1.png',
                      ),
                    ),
                    Positioned(
                      top: 30.w,
                      right: 30.w,
                      child: CarouselImgs(
                        h: 260.0.h,
                        w: 180.w,
                        img: 'assets/images/imgtest.png',
                      ),
                    ),
                    Positioned(
                      top: 15.h,
                      right: 85.w,
                      child: CarouselImgs(
                        h: 316.0.h,
                        w: 267.w,
                        img: 'assets/images/image1.png',
                      ),
                    ),
                  ],
                ),
              ),
              // CarouselSlider.builder(
              //   itemCount: 7,
              //   options: CarouselOptions(
              //     enlargeCenterPage: true,
              //     viewportFraction: 0.88,
              //     height: 450.h,
              //     autoPlayInterval: Duration(seconds: 3),
              //     autoPlayAnimationDuration: Duration(milliseconds: 800),
              //     autoPlayCurve: Curves.linearToEaseOut,
              //   ),
              //   itemBuilder:
              //       (BuildContext context, int itemIndex, int pageViewIndex) =>
              //           Stack(
              //     clipBehavior: Clip.none,
              //     children: [
              //       Positioned(
              //         top: 40,
              //         right: 5,
              //         child: CarouselImgs(
              //           h: 240.0.h,
              //           w: 170.w,
              //           img: 'assets/images/image1.png',
              //         ),
              //       ),
              //       Positioned(
              //         top: 30,
              //         right: 30,
              //         child: CarouselImgs(
              //           h: 260.0.h,
              //           w: 180.w,
              //           img: 'assets/images/imgtest.png',
              //         ),
              //       ),
              //       Positioned(
              //         top: 15,
              //         right: 60,
              //         child: CarouselImgs(
              //           h: 316.0.h,
              //           w: 267.w,
              //           img: 'assets/images/image1.png',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

_buildText(String title, String val) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: 'Clash Display',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      11.verticalSpace,
      Text(
        val,
        style: TextStyle(
          fontFamily: 'DM Sans',
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(205, 205, 205, 1),
        ),
      )
    ],
  );
}
