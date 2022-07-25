import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/screens/screen_three.dart';
import 'package:testapp/widgets/fav_frame.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                Color.fromRGBO(17, 15, 47, 1),
                Color.fromRGBO(34, 31, 83, 1),
              ]))),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/drawer.png')),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/searchicon.png')),
                    ],
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Find Your\n NFT’S Today',
                      style: TextStyle(
                        // ignore: prefer_const_constructors
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 35.0.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Clash Display',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(255, 255, 255, 0.26),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: const BorderSide(color: Colors.white70),
                            ),
                          ),
                          child: Text(
                            'Trending',
                            style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 16.sp),
                          ),
                        ),
                        SizedBox(
                          width: 36.w,
                        ),
                        Text(
                          'Populer',
                          style: TextStyle(
                              color: const Color.fromRGBO(137, 135, 163, 1),
                              fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 46.w,
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                              color: const Color.fromRGBO(137, 135, 163, 1),
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  // Build Widget Glassmorphism
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenThree()));
                    },
                    child: CarouselSlider.builder(
                      itemCount: 7,
                      options: CarouselOptions(
                          padEnds: true,
                          aspectRatio: 16 / 9,
                          //  height: 320.h,
                          viewportFraction: 0.8,
                          clipBehavior: Clip.none),
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          CarouselImgs(
                        h: 316.0.h,
                        w: 267.w,
                        img: 'assets/images/image1.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Latest Collection',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24.sp,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      //  height: 119.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white10),
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(85, 85, 85, 0.08),
                            Color.fromRGBO(15, 15, 15, 0.22),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Image.asset(
                                'assets/images/image2.png',
                                width: 88.w,
                                height: 88.h,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 15, bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Radis Rosbery',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1)),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'Saskehh Rio',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'DM Sans',
                                        color: const Color.fromRGBO(
                                            205, 205, 205, 1)),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    '0, 20ETH',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'DM Sans',
                                        color: const Color.fromRGBO(
                                            205, 205, 205, 1)),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: 20.h, right: 10.w),
                              child: FavFrame(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 18.w,
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      '230',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselImgs extends StatelessWidget {
  final double h;
  final String img;
  final double w;
  const CarouselImgs(
      {Key? key, required this.h, required this.w, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      // height: 316.0.h,
      // width: 267.0.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32.r),
            child: Image.asset(
              img,
              height: h,
              width: w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 18,
            right: 18,
            // ignore: sized_box_for_whitespace
            child: FavFrame(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 18.w,
                  ),
                  5.horizontalSpace,
                  Text(
                    '230',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 5,
            left: 5,
            child: SizedBox(
              height: 90.h,
              //  height: 100,
              child: Container(
                width: 231.w,
                height: 90.h,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(84, 84, 84, 0.21),
                        blurRadius: 16,
                        spreadRadius: 0,
                        offset: Offset(4, 4))
                  ],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white10),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.08),
                      Color.fromRGBO(255, 255, 255, 0.22),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Radis Rosbery',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontFamily: 'Clash Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Saskehh Rio',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DM Sans',
                                color: const Color.fromRGBO(205, 205, 205, 1)),
                          ),
                          Text(
                            '0, 20ETH',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DM Sans',
                                color: const Color.fromRGBO(205, 205, 205, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
