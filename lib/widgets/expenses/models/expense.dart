import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:repitition_time/widgets/expenses/enums/enum.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

const categoryIcons = {
  Categories.food: Icons.lunch_dining,
  Categories.leisure: Icons.movie,
  Categories.travel: Icons.flight_takeoff,
  Categories.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categories category;

  String get formatedDate {
    return formatter.format(date);
  }
}
