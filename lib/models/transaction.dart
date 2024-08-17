import 'dart:convert';

import 'package:pnb_one/models/user.dart';

class TransactionModel {
  final UserModel sender;
  final UserModel receiver;
  final double amount;
  final String id;

  TransactionModel({
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.id,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      sender: UserModel.fromJson(json['sender']),
      receiver: UserModel.fromJson(json['receiver']),
      amount: json['amount'],
      id: json['id'],
    );
  }
  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      sender: UserModel.fromMap(map['sender']),
      receiver: UserModel.fromMap(map['receiver']),
      amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
      id: map['_id'],
    );
  }
  @override
  String toString() {
    return 'TransactionModel(sender: $sender, receiver: $receiver, amount: $amount, id: $id, )';
  }
}
