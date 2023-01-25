import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class classPersinalized_Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Category(
        location_image: "assets/image_1.jpg",
        text1: "CHEST",
        subtext: "WORKOUT",
        minit: "5-8 MIN",
      ),
      SizedBox(height: 15.h),
      Category(
        location_image: "assets/image_2.jpg",
        text1: "CHEST",
        subtext: "WORKOUT",
        minit: "5-10 MIN",
      ),
    ]);
  }
}

class Category extends StatelessWidget {
  final String? location_image;
  final String? text1;
  final String? subtext;
  final String? minit;

  Category({
    this.text1,
    this.subtext,
    this.minit,
    this.location_image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.white, width: 0.1),
        image: DecorationImage(
            image: AssetImage(location_image!), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1!,
              style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subtext!,
              style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Text(
              minit!,
              style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
