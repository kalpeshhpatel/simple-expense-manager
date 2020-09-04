import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _removeTransaction;

  TransactionList(this._transactions, this._removeTransaction);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraint) {
          return Column(
            children: [
              Text(
                'No Transactions',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: constraint.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        })
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (context, index) {
              return TransactionCard(_transactions[index], _removeTransaction);
            },
          );
  }
}
