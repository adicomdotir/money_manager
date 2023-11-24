import 'package:flutter/material.dart';
import 'package:money_manager/features/home/presentation/widgets/drawer_widget.dart';
import 'package:money_manager/features/home/presentation/widgets/income_expense_list_widget.dart';
import 'package:money_manager/features/home/presentation/widgets/main_widget.dart';
import 'package:money_manager/features/home/presentation/widgets/top_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedTab = 0;
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
            TopBarWidget(
              scaffoldKey: scaffoldKey,
              selected: selectedTab,
              onTap: (int index) {
                setState(() {
                  selectedTab = index;
                });
              },
            ),
            const SizedBox(
              height: 24,
            ),
            MainWidget(
              amount: selectedTab == 0 ? '۲۵۰.۰۰۰ تومان' : '۳۰۰.۰۰۰ تومان',
            ),
            const SizedBox(
              height: 12,
            ),
            IncomeExpenseList(
              amountList: selectedTab == 0 ? expenses : incomes,
            ),
          ],
        ),
      ),
    );
  }
}
