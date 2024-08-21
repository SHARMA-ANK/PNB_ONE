import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pnb_one/constant/colors.dart';
import 'package:pnb_one/features/home/widgets/transactionTile.dart';
import 'package:pnb_one/models/transactionList.dart';

class TransactionDetailsScreen extends StatelessWidget {
  TransactionDetailsScreen({super.key});
  final Transactionlist transactionlist = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print(transactionlist);
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Transaction Details', style: TextStyle(color: primaryWhite)),
        centerTitle: true,
        backgroundColor: primaryBlack,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          width: mq.width * 0.8,
          child:
              TransactionTile(transaction: transactionlist.transactions[index]),
        ),
        itemCount: transactionlist.transactions.length,
      ),
    );
  }
}
