import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/core/common/size_extension.dart';
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
        height: context.convertForHeight(360),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(127, 127, 202, 0.25),
              blurRadius: 20,
            ),
          ],
          color: Colors.white,
        ),
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
                      : Colors.transparent,
                ),
                TabWidget(
                  title: 'هفتگی',
                  onTap: () {
                    setState(() {
                      selectedTab = week;
                    });
                  },
                  color: selectedTab == week
                      ? const Color(0xFFF50057).withOpacity(0.3)
                      : Colors.transparent,
                ),
                TabWidget(
                  title: 'ماهانه',
                  onTap: () {
                    setState(() {
                      selectedTab = month;
                    });
                  },
                  color: selectedTab == month
                      ? const Color(0xFFF50057).withOpacity(0.3)
                      : Colors.transparent,
                ),
                TabWidget(
                  title: 'سالانه',
                  onTap: () {
                    setState(() {
                      selectedTab = year;
                    });
                  },
                  color: selectedTab == year
                      ? const Color(0xFFF50057).withOpacity(0.3)
                      : Colors.transparent,
                ),
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
                                locale: Locale('fa'),
                              ),
                            ),
                          ),
                          child: child!,
                        );
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
                      : Colors.transparent,
                ),
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
                  child: const Text(' - '),
                ),
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
            // const SizedBox(
            //   height: 16,
            // ),
            SizedBox(
              height: context.convertForHeight(250),
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      startDegreeOffset: context.convertForHeight(200),
                      sectionsSpace: 0,
                      centerSpaceRadius: context.convertForHeight(60),
                      sections: [
                        PieChartSectionData(
                          value: 30,
                          color: Colors.greenAccent,
                          radius: 20,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 35,
                          color: Colors.blue.shade900,
                          radius: 20,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 20,
                          color: Colors.grey.shade400,
                          radius: 20,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 20,
                          color: Colors.brown.shade400,
                          radius: 20,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 20,
                          color: Colors.pink.shade400,
                          radius: 20,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 20,
                          color: Colors.yellow.shade400,
                          radius: 20,
                          showTitle: false,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '۲۵۰.۰۰۰ تومان',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
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
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            context.convertForWidth(12),
            4,
            context.convertForWidth(12),
            4,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: const Color(0xFF212121),
              fontSize: context.convertForHeight(14),
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
