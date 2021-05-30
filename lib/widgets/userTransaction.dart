import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class userTransaction extends StatefulWidget {
  final Function addTransaction;

  userTransaction(this.addTransaction);

  @override
  _userTransactionState createState() => _userTransactionState();
}

class _userTransactionState extends State<userTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime chosenDate;

  void submit() {
    final titlesubmit = titleController.text;
    final amountsubmit = (double.parse(amountController.text));

    if (titlesubmit.isEmpty || amountsubmit <= 0 || chosenDate == null) {
      return;
    }
    widget.addTransaction(
        double.parse(amountController.text), titleController.text, chosenDate);

    Navigator.of(context)
        .pop(); //closes modal sheet when we press confrim on keyboard
  }

  void _chooseDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          chosenDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'title'),
            autofocus: true,
            /*onChanged: (String value) {
                    title_inputvalue = value;
                  }*/
            controller: titleController,
            onSubmitted: (_) {
              submit();
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            keyboardType: TextInputType.number,
            autofocus: true,
            controller: amountController,
            onSubmitted: (_) {
              submit();
            },
            /*onChanged: (String value) {
                      //amount_inputvalue = value;
                    })*/
          ),
          Container(
            child: Row(
              children: [
                SizedBox(height: 10),
                Expanded(
                  child: Text((chosenDate == null)
                      ? 'No Date Is Choosen'
                      : 'Picked Date: ${DateFormat.yMd().format(chosenDate)}'),
                ),
                FlatButton(
                    onPressed: _chooseDate,
                    child: Text('Choose A Date',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ))),
              ],
            ),
          ),
          RaisedButton(
              onPressed: submit,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              child: Text(
                'ADD EXPENSES',
                style: TextStyle(color: Colors.white),
              ))
        ]),
      ),
    );
  }
}
