import 'package:flutter/material.dart';
import 'package:repitition_time/widgets/expenses/expense_item/expense_item.dart';
import 'package:repitition_time/widgets/expenses/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveExpense});
  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expensesList[index].id),
          child: ExpenseItem(
            expensesList[index],
          ),
          onDismissed: (direction) {
            onRemoveExpense(expensesList[index]);
          },
        ),
      ),
    );
  }
}
