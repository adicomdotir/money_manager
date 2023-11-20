import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BuildYearsText extends StatefulWidget {
  const BuildYearsText({super.key});

  @override
  State<BuildYearsText> createState() => _BuildYearsTextState();
}

class _BuildYearsTextState extends State<BuildYearsText> {
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
                year = year! + 1;
              });
            },
            child: Jalali.now().year == year
                ? const SizedBox()
                : const Icon(
                    Icons.arrow_back_ios,
                    size: 14,
                  ),
          ),
          const Spacer(),
          Text(year!.toString()),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                year = year! - 1;
              });
            },
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
