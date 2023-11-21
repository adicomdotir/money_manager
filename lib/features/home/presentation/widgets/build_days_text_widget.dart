import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BuildDaysText extends StatefulWidget {
  const BuildDaysText({super.key});

  @override
  State<BuildDaysText> createState() => _BuildDaysTextState();
}

class _BuildDaysTextState extends State<BuildDaysText> {
  Jalali? jalali = Jalali.now();
  int? day = Jalali.now().day;
  int? month = Jalali.now().month;
  int? year = Jalali.now().year;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Jalali(year!, month!, day!) == jalali
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    setState(() {
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
                  child: const SizedBox(
                    width: 25,
                    height: 25,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 14,
                    ),
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
            child: const SizedBox(
              width: 25,
              height: 25,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
