import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  var _selectedDate = null;

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
              controller: _titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) =>
                  _submitData(), // in the onSUbmitted method, it provides a parameters that have value of input, we use (_) just to receive and get rid of message of flutter(we won´t use this value) ((_)this underline means that i will receive the parameter but won´t use it-i don´t care about it´s value)
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amonut'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  _submitData(), // in the onSUbmitted method, it provides a parameters that have value of input, we use (_) just to receive and get rid of message of flutter(we won´t use this value) ((_)this underline means that i will receive the parameter but won´t use it-i don´t care about it´s value)
            ),
            Container(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked date : ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _presentDatePicker();
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              textColor: Theme.of(context).textTheme.button!.color,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Add Transaction',
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;
    if (enteredTitle.isEmpty ||
        enteredAmount.isEmpty ||
        double.parse(enteredAmount) <= 0 ||
        _selectedDate == null) {
      return;
    }

    widget.addNewTx(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
}
