import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) =>
                  submitData(), // in the onSUbmitted method, it provides a parameters that have value of input, we use (_) just to receive and get rid of message of flutter(we won´t use this value) ((_)this underline means that i will receive the parameter but won´t use it-i don´t care about it´s value)
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amonut'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  submitData(), // in the onSUbmitted method, it provides a parameters that have value of input, we use (_) just to receive and get rid of message of flutter(we won´t use this value) ((_)this underline means that i will receive the parameter but won´t use it-i don´t care about it´s value)
            ),
            FlatButton(
              onPressed: () {
                submitData();
              },
              textColor: Colors.purple,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;
    if (enteredTitle.isEmpty || enteredAmount.isEmpty) {
      return;
    }

    widget.addNewTx(titleController.text, double.parse(amountController.text));
  }
}
