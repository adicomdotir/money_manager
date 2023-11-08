import 'package:flutter/material.dart';
import 'package:money_manager/features/home/presentation/widgets/card_element_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/icons/money2.png',
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 60,
            ),
            cardElement(
              icon: 'categorize1.png',
              title: 'دسته بندی',
            ),
            const SizedBox(
              height: 16,
            ),
            cardElement(
              icon: 'settings.png',
              title: 'تنظیمات',
            ),
            const SizedBox(
              height: 16,
            ),
            cardElement(
              icon: 'report2.png',
              title: 'گزارش',
            ),
          ],
        ),
      ),
    );
  }
}
