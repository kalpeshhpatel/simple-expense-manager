import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction _transaction;
  final Function _removeTransaction;

  TransactionCard(this._transaction, this._removeTransaction);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${_transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMEd().format(_transaction.date),
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 14,
          ),
        ),
        trailing: mediaQuery.size.width >= 400
            ? FlatButton.icon(
                textColor: Colors.grey,
                onPressed: () => _removeTransaction(_transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Remove'),
              )
            : IconButton(
                color: Colors.grey,
                icon: Icon(Icons.delete),
                onPressed: () => _removeTransaction(_transaction.id),
              ),
      ),
    );
  }
}
