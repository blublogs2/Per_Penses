import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/main.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> trans;
  final Function _deleteTheTransaction;

  TransactionList(this.trans, this._deleteTheTransaction);

  @override
  Widget build(BuildContext context) {
    return trans.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Even though work stops, expenses run on',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/Untitled.jpg'))
              ],
            );
          })
        : SizedBox(
            height: 400,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
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
                        padding: EdgeInsets.all(6),
                        child: Container(
                          height: 20,
                          child: FittedBox(
                            child: Text('\₹${trans[index].amount}'),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      trans[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(trans[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            onPressed: () {
                              _deleteTheTransaction(trans[index].id);
                            },
                            icon: Icon(Icons.delete),
                            textColor: Colors.red,
                            label: Text('Delete'))
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {
                              _deleteTheTransaction(trans[index].id);
                            }),
                  ),
                );
              },
              itemCount: trans.length,
            ),
          );
  }
}
