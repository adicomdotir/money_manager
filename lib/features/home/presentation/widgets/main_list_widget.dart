import 'package:flutter/material.dart';
import 'package:money_manager/features/home/presentation/widgets/income_expense_list_widget.dart';

class MainList extends StatelessWidget {
  const MainList({
    super.key,
    required this.expenses,
  });
  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
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
