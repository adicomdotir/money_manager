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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Visibility(
            //       visible: selectedTab != day,
            //       child: Text(
            //         selectedTab == timePeriod
            //             ? label
            //             : getDate(selectedTab!).toPersianDate().toString(),
            //         style: const TextStyle(
            //           color: Color(0xFF212121),
            //         ),
            //       ),
            //     ),
            //     Visibility(
            //       visible: (selectedTab != day && selectedTab != timePeriod),
            //       child: const Text(' - '),
            //     ),
            //     Visibility(
            //       visible: selectedTab != timePeriod,
            //       child: Text(
            //         DateTime.now().toPersianDate().toString(),
            //         style: const TextStyle(
            //           color: Color(0xFF212121),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Jalali(year!, month!, day!) == jalali
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              // if (Jalali(year!, month!, day! + 1) <=
                              //     Jalali(year!, month!, jalali!.day)) {
                              //   print(jalali!.day);
                              day = day! + 1;

                              if (day! > Jalali(year!, month!).monthLength) {
                                day = 1;
                                if (month! + 1 <= 12) {
                                  month = month! + 1;
                                } else {
                                  day = 1;
                                  month = 1;
                                  year = year! + 1;
                                }
                              }
                            });
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 14,
                          ),
                        ),
                  const Spacer(),
                  Jalali(year!, month!, day!) == jalali
                      ? const Text('امروز ')
                      : const SizedBox(),
                  Text(
                    Jalali(year!, month!, day!).toDateTime().toPersianDate(),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (day! - 1 <= Jalali(year!, month!).monthLength &&
                            day! - 1 > 0) {
                          day = day! - 1;
                        } else {
                          if (month! - 1 >= 1) {
                            day = Jalali(
                              year!,
                              month! - 1,
                            ).monthLength;
                            month = month! - 1;
                          } else {
                            day = Jalali(
                              year! - 1,
                              12,
                            ).monthLength;
                            month = 12;
                            year = year! - 1;
                          }
                        }
                      });
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ],
              ),
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
