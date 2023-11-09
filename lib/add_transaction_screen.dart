import 'package:flutter/material.dart';
import 'package:money_manager/features/home/presentation/widgets/main_widget.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  // Height = 2400 && Width = 1080

  int? selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF50057),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 110,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
              color: const Color(0xFFF50057),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/drawer1.png',
                        color: Colors.white,
                        width: 20,
                      ),
                      const Text(
                        'افزودن تراکنش',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
                          onTap: () {
                            setState(() {
                              selectedTab = 0;
                            });
                          },
                          child: Center(
                            child: Text(
                              'هزینه ها',
                              style: TextStyle(
                                color: selectedTab == 0
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
                          onTap: () {
                            setState(() {
                              selectedTab = 1;
                            });
                          },
                          child: Center(
                            child: Text(
                              'درامد ها',
                              style: TextStyle(
                                color: selectedTab == 1
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
            ),
            const SizedBox(
              height: 24,
            ),
            const Text('Account'),
            const Text('Main'),
            const Text('Categories'),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44 / 1080 * size.width),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryItem(
                    size: size,
                    color: const Color(0xFFf63635),
                    title: 'Health',
                  ),
                  CategoryItem(
                    size: size,
                    color: const Color(0xFF67ae44),
                    title: 'Health',
                  ),
                  CategoryItem(
                    size: size,
                    color: const Color(0xFF2e78cf),
                    title: 'Health',
                  ),
                  CategoryItem(
                    size: size,
                    color: const Color(0xFFf1cb06),
                    title: 'Health',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44 / 1080 * size.width),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryItem(
                    size: size,
                    color: const Color(0xFFf63635),
                    title: 'Health',
                  ),
                  CategoryItem(
                    size: size,
                    color: const Color(0xFF67ae44),
                    title: 'Health',
                  ),
                  CategoryItem(
                    size: size,
                    color: const Color(0xFF2e78cf),
                    title: 'Health',
                  ),
                  CategoryItem(
                    size: size,
                    color: const Color(0xFFf1cb06),
                    title: 'Health',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: DateBoxWidget(
                      title: '11/7',
                      subTitle: 'امروز',
                      selected: true,
                    ),
                  ),
                  Expanded(
                    child: DateBoxWidget(title: '11/6', subTitle: 'دیروز'),
                  ),
                  Expanded(
                    child: DateBoxWidget(title: '11/1', subTitle: 'اخرین'),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(Icons.calendar_month),
                      ],
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

class DateBoxWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool selected;

  const DateBoxWidget({
    super.key,
    required this.subTitle,
    required this.title,
    this.selected = false,
  });

  final selectedStyle = const TextStyle(color: Colors.white);
  final unSelectedStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFF50057) : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: selected ? selectedStyle : unSelectedStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subTitle,
            style: selected ? selectedStyle : unSelectedStyle,
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.size,
    required this.color,
    required this.title,
  });

  final Size size;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          width: 170 / 1080 * size.width,
          height: 170 / 1080 * size.width,
          child: const Icon(
            Icons.health_and_safety_outlined,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(title),
      ],
    );
  }
}
