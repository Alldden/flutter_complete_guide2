import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();

  final amountControler = TextEditingController();

  void submitData() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
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
              controller: titleControler,
              onSubmitted: (_) => submitData(),
              /* onChanged: (val) => titleInput = val, */
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              /* onChanged: (val) => amountInput = val, */
            ),
            TextButton(
              onPressed: submitData,
              child: Text("Add Transaction"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple)),
            )
          ],
        ),
      ),
    );
  }
}
