import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DashboardScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///============= carousal slider var ==================
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/image_4.jpg',
    'assets/image_1.jpg',
    'assets/image_2.jpg',
    'assets/image_3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "DEROFIT - WORKOUT PLANNER",
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text("VOLUME UP YOUR BODY GOALS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 50.h),

                  ///====================== carousel_slider ====================
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: urlImages.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = urlImages[index];
                        return buildImage(urlImage, index);
                      },
                      options: CarouselOptions(
                          height: 285.h,
                          autoPlay: false,
                          viewportFraction: 0.72,
                          // enableInfiniteScroll: false,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index))),

                  ///================= ElevatedButton Button ==================

                  SizedBox(height: 69.h),

                  SizedBox(
                    height: 55.h,
                    width: 330.w,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lime.shade500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          "START BUILDING YOUR BODY",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 18),
                        )),
                  ),
                  SizedBox(height: 30.h),
                  const Text(
                    "DONT HAVE ANY ACCOUNT? REGISTER",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///===================== carousal slider image container code =========================

Widget buildImage(String urlImage, int index) => Container(
      width: 235.w,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(urlImage, fit: BoxFit.cover)),
      ),
    );
