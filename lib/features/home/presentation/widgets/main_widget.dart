import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/core/common/size_extension.dart';
import 'package:money_manager/features/home/presentation/widgets/build_days_text_widget.dart';
import 'package:money_manager/features/home/presentation/widgets/build_month_Text_widget.dart';
import 'package:money_manager/features/home/presentation/widgets/tab_widget.dart';
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
  static const String dayString = 'day';
  static const String week = 'week';
  static const String monthString = 'month';
  static const String yearString = 'year';
  static const String timePeriod = 'timePeriod';

  String? selectedTab = dayString;
  String label = '';

  Jalali? jalali = Jalali.now();
  int? day = Jalali.now().day;
  int? month = Jalali.now().month;
  int? year = Jalali.now().year;

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
                      selectedTab = dayString;
                    });
                  },
                  color: selectedTab == dayString
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
                      selectedTab = monthString;
                    });
                  },
                  color: selectedTab == monthString
                      ? const Color(0xFFF50057).withOpacity(0.3)
                      : Colors.transparent,
                ),
                TabWidget(
                  title: 'سالانه',
                  onTap: () {
                    setState(() {
                      selectedTab = yearString;
                    });
                  },
                  color: selectedTab == yearString
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
            Visibility(
              visible: selectedTab == dayString,
              child: const BuildDaysText(),
            ),
            Visibility(
              visible: selectedTab == monthString,
              child: const BuildMonthText(),
            ),
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
                          color: Colors.orange.shade400,
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

String numberToMonth(String number) {
  switch (number) {
    case '1':
      return 'فروردین';
    case '2':
      return 'اردیبهشت';
    case '3':
      return 'خرداد';
    case '4':
      return 'تیر';
    case '5':
      return 'مرداد';
    case '6':
      return 'شهریور';
    case '7':
      return 'مهر';
    case '8':
      return 'آبان';
    case '9':
      return 'آذر';
    case '10':
      return 'دی';
    case '11':
      return 'بهمن';
    case '12':
      return 'اسفند';

    default:
      return '';
  }
}
