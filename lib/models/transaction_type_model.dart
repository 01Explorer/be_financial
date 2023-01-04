import 'package:flutter/material.dart';

class TransactionType {
  final IconData desiredIcon;
  final String type;

  TransactionType(this.desiredIcon, this.type);

  static List<TransactionType> base() {
    return [
      TransactionType(Icons.food_bank, 'Food'),
      TransactionType(Icons.paragliding_rounded, 'Going Out'),
      TransactionType(Icons.home_rounded, 'Home Expenses'),
    ];
  }
}
