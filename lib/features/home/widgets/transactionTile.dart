import 'package:flutter/material.dart';
import 'package:pnb_one/constant/colors.dart';
import 'package:pnb_one/models/transactionList.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key, required this.transaction});
  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: transaction.transactionType == "Debit"
          ? CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            )
          : CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
      title: Text(
        transaction.transactionType == "Credit" ? "Credit" : "Debit",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: primaryWhite,
        ),
      ),
      subtitle: Text(
        transaction.transactionType == "Credit"
            ? "Payment Received"
            : "Payment Sent",
      ),
      trailing: transaction.transactionType == "Credit"
          ? Text(
              "+₹${transaction.amount}",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(
              "-₹${transaction.amount}",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
