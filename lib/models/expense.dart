import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum ExpenseCategory { food, travel, leisure, work }

const categoryIcon = {
  ExpenseCategory.food: Icons.fastfood_rounded,
  ExpenseCategory.travel: Icons.airplanemode_active_rounded,
  ExpenseCategory.leisure: Icons.movie_rounded,
  ExpenseCategory.work: Icons.work_rounded
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate {
    return formatter.format(date);
  }
}


