import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(
      {required this.userTransactions, required this.deleteTransaction});

//solution with ListView.builder
  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (contex, index) {
              return TransactionItem(
                  userTransaction: userTransactions[index],
                  deleteTransaction: deleteTransaction);
              //solution with Card widget
              // return Card(
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //             border: Border.all(
              //           color: Theme.of(context).primaryColor,
              //           width: 2,
              //         )),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           'R\$ ${userTransactions[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             userTransactions[index].title,
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 16,
              //             ),
              //           ),
              //           Text(
              //             DateFormat().format(userTransactions[index].date),
              //             style: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // );
            },
            itemCount: userTransactions.length,
          );
  }
}

//solution with ListView(chldren : [])
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 370,
//       child: ListView(
//         children: userTransactions.map((item) {
//           return Card(
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 15,
//                   ),
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                     color: Colors.purple,
//                     width: 2,
//                   )),
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     'R\$ ${item.amount}',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.purple),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       item.title,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     Text(
//                       DateFormat().format(item.date),
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

//solution with column
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: userTransactions.map((item) {
//         return Card(
//           child: Row(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.symmetric(
//                   vertical: 10,
//                   horizontal: 15,
//                 ),
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                   color: Colors.purple,
//                   width: 2,
//                 )),
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   'R\$ ${item.amount}',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: Colors.purple),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     item.title,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   Text(
//                     DateFormat().format(item.date),
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
