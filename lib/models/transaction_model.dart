import 'transaction_type_model.dart';

enum InOrOut { transferred, received }

class Transaction {
  final InOrOut transactionInOrOut;
  final String title;
  final double amount;
  late final String? receiver;
  late final String? payer;
  final String? description;
  final DateTime date;
  final TransactionType transactionType;

  Transaction(String name,
      {required this.title,
      required this.transactionInOrOut,
      required this.amount,
      this.description,
      required this.date,
      required this.transactionType}) {
    if (transactionInOrOut == InOrOut.received) {
      payer = name;
      receiver = null;
    }
    if (transactionInOrOut == InOrOut.transferred) {
      receiver = name;
      payer = null;
    }
  }
}
