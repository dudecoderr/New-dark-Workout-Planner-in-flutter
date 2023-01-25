import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/Personalized_Constant.dart';
import '../constant/dashboard_constant_container.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Column(
              children: [
                Container(
                  // color: Colors.yellowAccent,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/profile2.jpg"),
                        radius: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "WELLCOME BACK,",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(height: 5.h),
                            const Text(
                              "MICHAEL BERNANDO",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),

                ///=======================   constant containet =============================
                Dashboard_short_Container(),
                //=======================   constant containet  end=============================
                SizedBox(height: 20.h),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "CALORIES",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "WEEKLY AVERAGE",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 250),
                          child: Text(
                            "102 CAL",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),

                        ///============== chart ==================
                        Expanded(flex: 5, child: Chart()),
                      ],
                    ),
                  ),
                ),

                ///======================== PERSONALIZED PLAN  container===================
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      "PERSONALIZED PLAN",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "VIEW ALL",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                ///====================== classPersinalized_Container ==========================
                classPersinalized_Container(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///============== chart ==================

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => ChartState();
}

class ChartState extends State<Chart> {
  int tapIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        // remove background grid
        gridData: FlGridData(show: false),
        // remove the borders
        borderData: FlBorderData(
          border: const Border(
            bottom: BorderSide(width: 1, color: Colors.transparent),
          ),
        ),
        // titles
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final day = spendings[value.toInt()].day;
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    day,
                    style: TextStyle(
                      color: tapIndex == value.toInt()
                          ? Colors.grey.shade400
                          : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        maxY: maxValue.toDouble(),
        barTouchData: BarTouchData(
          touchCallback: (event, response) {
            if (response != null && event is FlTapUpEvent) {
              setState(() {
                if (response.spot != null) {
                  tapIndex = response.spot!.touchedBarGroupIndex;
                }
              });
            }
          },
        ),
        barGroups: [
          for (int i = 0; i < spendings.length; i++)
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: spendings[i].spending.toDouble(),
                  color: tapIndex == i ? Colors.lime.shade500 : Colors.white12,
                  width: 30.w,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}

class DailySpending {
  DailySpending(this.day, this.spending);

  final String day;
  final int spending;
}

final spendings = <DailySpending>[
  DailySpending('SUN', 1500),
  DailySpending('MON', 2500),
  DailySpending('TUE', 3000),
  DailySpending('WED', 2200),
  DailySpending('THU', 2500),
  DailySpending('FRI', 2900),
  DailySpending('SAT', 1800),
];

final maxValue = spendings.map((e) => e.spending).reduce(max);
