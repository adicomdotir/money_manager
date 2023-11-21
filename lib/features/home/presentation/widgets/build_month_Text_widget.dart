import 'package:flutter/material.dart';
import 'package:money_manager/features/home/presentation/widgets/main_widget.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BuildMonthText extends StatefulWidget {
  const BuildMonthText({super.key});

  @override
  State<BuildMonthText> createState() => _BuildMonthTextState();
}

class _BuildMonthTextState extends State<BuildMonthText> {
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
          GestureDetector(
            onTap: () {
              setState(() {
                if (month! + 1 > 12) {
                  year = year! + 1;
                  month = 1;
                } else {
                  month = month! + 1;
                }
              });
            },
            child: Jalali(year!, month!, day!) == jalali
                ? const SizedBox()
                : const SizedBox(
                    width: 25,
                    height: 25,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 14,
                    ),
                  ),
          ),
          const Spacer(),
          Text(numberToMonth(month!.toString())),
          const SizedBox(
            width: 12,
          ),
          Text(year!.toString()),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                if (month! - 1 < 1) {
                  year = year! - 1;
                  month = 12;
                } else {
                  month = month! - 1;
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
