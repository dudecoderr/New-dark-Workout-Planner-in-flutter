import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard_short_Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Category(
          icon: Icons.directions_run_outlined, text: "STAPES", steps: "6.359"),
      Spacer(),
      Category(
        icon: Icons.local_fire_department_outlined,
        steps: "3.115 KCAL",
        text: "CAL BURN",
      ),
      Spacer(),
      Category(
        icon: Icons.favorite_border_outlined,
        steps: "123 BPM",
        text: "HEARTBEAT",
      ),
    ]);
  }
}

class Category extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final String? steps;

  Category({
    this.text,
    this.icon,
    this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: Colors.white12, borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Icon(
                icon,
                color: Colors.lime.shade500,
                size: 30.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                steps!,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              Text(
                text!,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
