import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, Constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No transactions added yet. :(',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: Constraints.maxHeight * 0.6,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // Set the border radius
                ),
                color: Theme.of(context).primaryColorLight,
                margin: EdgeInsets.all(15),
                elevation: 20,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                        child: Text(
                          '\$${transactions[index].amount}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    (transactions[index].title) as String,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format((transactions[index].date)!),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteTx(transactions[index].id),
                    color: Theme.of(context).errorColor,
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
// return Card(
                  // child: Row(
                  //   children: <Widget>[
                  //     Container(
                  //       height: 60,
                  //       width: 60,
                  //       padding: EdgeInsets.all(10),
                  //       margin:
                  //           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  //       decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Theme.of(context).primaryColorDark,
                  //             width: 2,
                  //           ),
                  //           shape: BoxShape.circle),
                  //       child: FittedBox(
                  //         child: Text(
                  //           '\$${transactions[index].amount!.toStringAsFixed(2)}',
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 20,
                  //             color: Theme.of(context).primaryColorDark,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(
                  //           transactions[index].title.toString(),
                  //           style: Theme.of(context).textTheme.headline6,
                  //         ),
                  //         Text(
                  //           DateFormat.yMMMd()
                  //               .format(transactions[index].date!),
                  //           style: TextStyle(
                  //             color: Colors.grey,
                  //           ),
                  //         ),          
                  //       ],
                  //     ),                   
                  //   ],
                  // ),
                // );