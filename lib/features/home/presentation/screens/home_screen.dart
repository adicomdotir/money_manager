import 'package:flutter/material.dart';
import 'package:money_manager/core/common/size_extension.dart';
import 'package:money_manager/features/home/presentation/widgets/drawer_widget.dart';
import 'package:money_manager/features/home/presentation/widgets/main_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int? selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerWidget(),
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
          children: [
            Container(
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
            const MainWidget(),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];
                  return Padding(
                    padding:
                        EdgeInsets.fromLTRB(24, index == 0 ? 4 : 10, 24, 0),
                    child: Container(
                      width: double.maxFinite,
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(127, 127, 202, 0.25),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                expense.iconPath,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                expense.category,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Text(
                            '${expense.amount}  تومان',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseModel {
  final String amount;
  final String category;
  final String iconPath;
  final bool isExpense;

  ExpenseModel({
    required this.amount,
    required this.category,
    required this.iconPath,
    required this.isExpense,
  });
}

final List<ExpenseModel> expenses = [
  ExpenseModel(
    amount: '۵۰.۰۰۰',
    category: 'غذا',
    iconPath: 'assets/icons/food.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۴۵۰.۰۰۰',
    category: 'خانه',
    iconPath: 'assets/icons/home.png',
    isExpense: false,
  ),
  ExpenseModel(
    amount: '۱۵۰.۰۰۰',
    category: 'خانه',
    iconPath: 'assets/icons/home.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۶۰.۰۰۰',
    category: 'رفت و آمد',
    iconPath: 'assets/icons/taxi2.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۳۲۰.۰۰۰',
    category: 'ورزش',
    iconPath: 'assets/icons/dumbbell.png',
    isExpense: false,
  ),
  ExpenseModel(
    amount: '۵۰۰.۰۰۰',
    category: 'لباس',
    iconPath: 'assets/icons/jeans.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۴۱۰.۰۰۰',
    category: 'لباس',
    iconPath: 'assets/icons/jeans.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۵۰۰.۰۰۰',
    category: 'لباس',
    iconPath: 'assets/icons/jeans.png',
    isExpense: false,
  ),
  ExpenseModel(
    amount: '۱۵۰.۰۰۰',
    category: 'خانه',
    iconPath: 'assets/icons/home.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۶۰.۰۰۰',
    category: 'رفت و آمد',
    iconPath: 'assets/icons/taxi2.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۳۲۰.۰۰۰',
    category: 'ورزش',
    iconPath: 'assets/icons/dumbbell.png',
    isExpense: false,
  ),
];
