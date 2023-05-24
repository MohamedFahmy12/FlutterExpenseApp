import 'package:flutter/material.dart';
import 'package:repitition_time/widgets/expenses/create_expense/create_expense.dart';
import 'package:repitition_time/widgets/expenses/data/expenses_data.dart';
import 'package:repitition_time/widgets/expenses/expenses_list/expenses_list.dart';
import 'package:repitition_time/widgets/expenses/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverLay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onCreateExpense: _afterAddExpense));
  }

  void _afterAddExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverLay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ExpensesList(expensesList: expenses,onRemoveExpense: (expense) => expenses.remove(expense),)
        ],
      ),
    );
  }
}
