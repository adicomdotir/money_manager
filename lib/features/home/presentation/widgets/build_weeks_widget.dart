import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BuildWeeksText extends StatefulWidget {
  const BuildWeeksText({super.key});

  @override
  State<BuildWeeksText> createState() => _BuildWeeksTextState();
}

class _BuildWeeksTextState extends State<BuildWeeksText> {
  DateTime present = DateTime.now();
  DateTime back = DateTime.now().subtract(const Duration(days: 6));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                present = present.add(const Duration(days: 6));
                back = back.add(const Duration(days: 6));
              });
            },
            child: DateFormat('yyyy-MM-dd').format(present) ==
                    DateFormat('yyyy-MM-dd').format(DateTime.now())
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
          Text(
            DateFormat('yyyy-MM-dd').format(present).toString().toPersianDate(),
          ),
          const Text(' - '),
          Text(
            DateFormat('yyyy-MM-dd').format(back).toString().toPersianDate(),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                present = back;
                back = back.subtract(const Duration(days: 6));
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
