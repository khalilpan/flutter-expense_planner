import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.userTransaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text('R\$${userTransaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          userTransaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat().add_yMMMEd().format(userTransaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),

        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => deleteTransaction(userTransaction.id),
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: Text('Delete'),
              )
            : IconButton(
                onPressed: () => deleteTransaction(userTransaction.id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),

        // trailing: OutlinedButton(
        //   onPressed: () {},
        //   child: const Text(
        //     'Delete',
        //     style: TextStyle(fontWeight: FontWeight.bold),
        //   ),
        // ),
      ),
    );
  }
}
