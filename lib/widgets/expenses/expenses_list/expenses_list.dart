import 'package:flutter/material.dart';
import 'package:repitition_time/widgets/expenses/expense_item/expense_item.dart';
import 'package:repitition_time/widgets/expenses/models/expense.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveExpense});
  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  State<StatefulWidget> createState() {
    return _ExpensesList();
  }
}

class _ExpensesList extends State<ExpensesList> {
  _onRemove(Expense expense, int index) {
    setState(() {
      widget.onRemoveExpense(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                widget.expensesList.insert(index, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No Expenses Found'),
    );
    if (widget.expensesList.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: widget.expensesList.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(widget.expensesList[index].id),
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(.2),
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal / 2),
          ),
          child: ExpenseItem(
            widget.expensesList[index],
          ),
          onDismissed: (direction) {
            _onRemove(widget.expensesList[index], index);
          },
        ),
      );
    }
    return Expanded(child: mainContent);
  }
}
