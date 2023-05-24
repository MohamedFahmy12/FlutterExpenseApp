import 'package:repitition_time/widgets/expenses/enums/enum.dart';
import 'package:repitition_time/widgets/expenses/models/expense.dart';

List<Expense> expenses = [
  Expense(
      title: 'Flutter Cours',
      amount: 19.99,
      date: DateTime.now(),
      category: Categories.work),
     Expense(
      title: 'Cinema',
      amount: 15,
      date: DateTime.now(),
      category: Categories.leisure),
];
