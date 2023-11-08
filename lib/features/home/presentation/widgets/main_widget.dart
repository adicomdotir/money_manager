import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({
    super.key,
  });

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  static const String day = 'day';
  static const String week = 'week';
  static const String month = 'month';
  static const String year = 'year';
  static const String timePeriod = 'timePeriod';

  String? selectedTab = day;
  String label = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.maxFinite,
        height: 360,
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
                TabWidget(
                    title: 'روزانه',
                    onTap: () {
                      setState(() {
                        selectedTab = day;
                      });
                    },
                    color: selectedTab == day
                        ? const Color(0xFFF50057).withOpacity(0.3)
                        : Colors.transparent),
                TabWidget(
                    title: 'هفتگی',
                    onTap: () {
                      setState(() {
                        selectedTab = week;
                      });
                    },
                    color: selectedTab == week
                        ? const Color(0xFFF50057).withOpacity(0.3)
                        : Colors.transparent),
                TabWidget(
                    title: 'ماهانه',
                    onTap: () {
                      setState(() {
                        selectedTab = month;
                      });
                    },
                    color: selectedTab == month
                        ? const Color(0xFFF50057).withOpacity(0.3)
                        : Colors.transparent),
                TabWidget(
                    title: 'سالانه',
                    onTap: () {
                      setState(() {
                        selectedTab = year;
                      });
                    },
                    color: selectedTab == year
                        ? const Color(0xFFF50057).withOpacity(0.3)
                        : Colors.transparent),
                TabWidget(
                    title: 'بازه زمانی',
                    onTap: () async {
                      setState(() {
                        selectedTab = timePeriod;
                      });
                      var picked = await showPersianDateRangePicker(
                        context: context,
                        builder: (context, child) {
                          return Theme(
                              data: ThemeData(
                                  textTheme: const TextTheme(
                                      bodyMedium: TextStyle(
                                          fontFamily: 'IranYekan',
                                          locale: Locale('fa')))),
                              child: child!);
                        },
                        initialEntryMode: PDatePickerEntryMode.input,
                        useRootNavigator: true,
                        initialDateRange: JalaliRange(
                          start: Jalali(1400, 1, 2),
                          end: Jalali(1400, 1, 10),
                        ),
                        firstDate: Jalali(1385, 8),
                        lastDate: Jalali(1450, 9),
                      );
                      setState(() {
                        label =
                            "${picked?.start.toDateTime().toPersianDate() ?? ""} - ${picked?.end.toDateTime().toPersianDate() ?? ""}";
                      });
                    },
                    color: selectedTab == timePeriod
                        ? const Color(0xFFF50057).withOpacity(0.3)
                        : Colors.transparent),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: selectedTab != day,
                  child: Text(
                    selectedTab == timePeriod
                        ? label
                        : getDate(selectedTab!).toPersianDate().toString(),
                    style: const TextStyle(
                      color: Color(0xFF212121),
                    ),
                  ),
                ),
                Visibility(
                    visible: (selectedTab != day && selectedTab != timePeriod),
                    child: const Text(' - ')),
                Visibility(
                  visible: selectedTab != timePeriod,
                  child: Text(
                    DateTime.now().toPersianDate().toString(),
                    style: const TextStyle(
                      color: Color(0xFF212121),
                    ),
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

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });
  final String title;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF212121),
            ),
          ),
        ),
      ),
    );
  }
}

DateTime getDate(String date) {
  switch (date) {
    case 'day':
      return DateTime.now();
    case 'week':
      return DateTime.now().subtract(const Duration(days: 7));
    case 'month':
      return DateTime.now().subtract(const Duration(days: 30));
    case 'year':
      return DateTime.now().subtract(const Duration(days: 365));
    default:
      return DateTime.now();
  }
}
