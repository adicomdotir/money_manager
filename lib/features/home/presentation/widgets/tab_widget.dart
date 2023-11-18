import 'package:flutter/material.dart';
import 'package:money_manager/core/common/size_extension.dart';

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
