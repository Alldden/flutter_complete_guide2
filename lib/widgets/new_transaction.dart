import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

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
              /* onChanged: (val) => titleInput = val, */
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountControler,
              /* onChanged: (val) => amountInput = val, */
            ),
            TextButton(
              onPressed: () => {print(titleControler.text)},
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
