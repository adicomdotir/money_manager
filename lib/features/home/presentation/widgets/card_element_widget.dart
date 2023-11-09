import 'package:flutter/material.dart';

Widget cardElement({
  String? icon,
  String? title,
  Color? iconColor,
  bool? hasDevider = true,
  double? height = 50,
  TextStyle? textStyle,
}) {
  iconColor ??= Colors.black.withOpacity(0.5);
  textStyle ??= const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  return Container(
    height: height,
    decoration: BoxDecoration(
      border: hasDevider!
          ? Border(
              bottom: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
            )
          : null,
    ),
    child: Row(
      textDirection: TextDirection.rtl,
      children: [
        SizedBox(
            width: 40,
            child: Center(
              child: Image.asset(
                'assets/icons/$icon',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            )),
        Text(
          title!,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: textStyle,
        ),
      ],
    ),
  );
}
