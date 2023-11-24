import 'package:flutter/material.dart';

class IncomeExpenseList extends StatelessWidget {
  const IncomeExpenseList({
    super.key,
    required this.amountList,
  });
  final List<ExpenseModel> amountList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = amountList[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(24, index == 0 ? 4 : 10, 24, 0),
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

final List<ExpenseModel> incomes = [
  ExpenseModel(
    amount: '۲۰.۰۰۰',
    category: 'ورزش',
    iconPath: 'assets/icons/dumbbell.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۱۵۰.۰۰۰',
    category: 'رفت و آمد',
    iconPath: 'assets/icons/taxi2.png',
    isExpense: false,
  ),
  ExpenseModel(
    amount: '۹۰.۰۰۰',
    category: 'خانه',
    iconPath: 'assets/icons/home.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۴۸.۰۰۰',
    category: 'خانه',
    iconPath: 'assets/icons/home.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۲۰۰.۰۰۰',
    category: 'لباس',
    iconPath: 'assets/icons/jeans.png',
    isExpense: false,
  ),
  ExpenseModel(
    amount: '۳۶۰.۰۰۰',
    category: 'لباس',
    iconPath: 'assets/icons/jeans.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۴۱۰.۰۰۰',
    category: 'خانه',
    iconPath: 'assets/icons/home.png',
    isExpense: true,
  ),
  ExpenseModel(
    amount: '۵۰۰.۰۰۰',
    category: 'رفت و آمد',
    iconPath: 'assets/icons/taxi2.png',
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
