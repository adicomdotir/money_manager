import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.maxFinite,
        height: 380,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(127, 127, 202, 0.25), blurRadius: 20),
            ],
            color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFF50057).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(14)),
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                        child: Text(
                          'روز',
                          style: TextStyle(
                            color: Color(0xFF212121),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'هفته',
                  style: TextStyle(
                    color: Color(0xFF212121),
                  ),
                ),
                const Text(
                  'ماه',
                  style: TextStyle(
                    color: Color(0xFF212121),
                  ),
                ),
                const Text(
                  'سال',
                  style: TextStyle(
                    color: Color(0xFF212121),
                  ),
                ),
                const Text(
                  'بازه زمانی',
                  style: TextStyle(
                    color: Color(0xFF212121),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'امروز',
                  style: TextStyle(
                    color: Color(0xFF212121),
                  ),
                ),
                Text(
                  DateTime.now().toPersianDate(),
                  style: const TextStyle(
                    color: Color(0xFF212121),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      startDegreeOffset: 250,
                      sectionsSpace: 0,
                      centerSpaceRadius: 80,
                      sections: [
                        PieChartSectionData(
                          value: 45,
                          color: Colors.greenAccent,
                          radius: 35,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 35,
                          color: Colors.blue.shade900,
                          radius: 25,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 20,
                          color: Colors.grey.shade400,
                          radius: 20,
                          showTitle: false,
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 10.0,
                                spreadRadius: 10.0,
                                offset: const Offset(3.0, 3.0),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              "۲۵۰.۰۰۰ تومان",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
