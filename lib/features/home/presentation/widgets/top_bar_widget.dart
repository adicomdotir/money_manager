import 'package:flutter/material.dart';
import 'package:money_manager/core/common/size_extension.dart';

class TopBarWidget extends StatelessWidget {
  final int selected;
  final Function(int index) onTap;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const TopBarWidget({
    super.key,
    required this.selected,
    required this.onTap,
    required this.scaffoldKey,
  });
  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: context.convertForHeight(110),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
      color: const Color(0xFFF50057),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => scaffoldKey.currentState!.openDrawer(),
                child: Image.asset(
                  'assets/icons/drawer1.png',
                  color: Colors.white,
                  width: 20,
                ),
              ),
              const Column(
                children: [
                  Text(
                    'موجودی',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    '۴.۵۰۰.۰۰۰ تومان',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/icons/report1.png',
                color: Colors.white,
                width: 20,
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => onTap(0),
                  child: Center(
                    child: Text(
                      'هزینه ها',
                      style: TextStyle(
                        color: selected == 0
                            ? Colors.white
                            : const Color(0xFFF48FB1),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => onTap(1),
                  child: Center(
                    child: Text(
                      'درامد ها',
                      style: TextStyle(
                        color: selected == 1
                            ? Colors.white
                            : const Color(0xFFF48FB1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
