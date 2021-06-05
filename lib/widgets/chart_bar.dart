import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({Key? key}) : super(key: key);
  final String weekDay;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  ChartBar(this.weekDay, this.spendingAmount, this.spendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.10,
              child: FittedBox(
                child: Text('R\$${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercentageOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.10,
              child: FittedBox(
                child: Text(weekDay),
              ),
            ),
          ],
        );
      },
    );
  }
}
