import 'dart:convert';

class Transaction {
  final String id;
  final String transactionType;
  final int amount;
  final String date;
  Transaction({
    required this.id,
    required this.transactionType,
    required this.amount,
    required this.date,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['_id'] as String? ?? 'Unknown ID',
      transactionType:
          map['transactionType'] as String? ?? 'Unknown transactionType',
      amount: map['amount'] as int? ?? 0,
      date: map['date'] as String? ?? 'Unknown date',
    );
  }
  factory Transaction.fromJson(String source) {
    final Map<String, dynamic> map = json.decode(source);
    return Transaction.fromMap(map);
  }
  @override
  String toString() {
    return 'Transaction(id: $id, transactionType: $transactionType, amount: $amount, date: $date)';
  }
}

class Transactionlist {
  final List<Transaction> transactions;
  Transactionlist({
    required this.transactions,
  });

  factory Transactionlist.fromMap(Map<String, dynamic> map) {
    return Transactionlist(
      transactions: List<Transaction>.from(
          map['transactions']?.map((x) => Transaction.fromMap(x))),
    );
  }
  factory Transactionlist.fromJson(String source) {
    final Map<String, dynamic> map = json.decode(source);
    return Transactionlist.fromMap(map);
  }
  @override
  String toString() {
    return 'Transactionlist(transactions: $transactions)';
  }
}
