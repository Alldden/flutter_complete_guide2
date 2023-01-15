import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();

  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleControler.text;
    final enteredAmount = double.parse(_amountControler.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
      if (pickedDate == null) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _titleControler,
              onSubmitted: (_) => _submitData(),
              /* onChanged: (val) => titleInput = val, */
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              /* onChanged: (val) => amountInput = val, */
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? "No date chosen!"
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                ),
                TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Chose Date',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text("Add Transaction"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple)),
            )
          ],
        ),
      ),
    );
  }
}
