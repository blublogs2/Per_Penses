import 'package:flutter/material.dart';

class Chart_Bar extends StatelessWidget {
  final String label;
  // ignore: non_constant_identifier_names
  final double spending_amount;
  final double ttlspendingperc;

  Chart_Bar(this.label, this.spending_amount, this.ttlspendingperc);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(children: [
        Container(
          height: constraints.maxHeight * 0.15,
          child: FittedBox(
            child: Text('\₹${spending_amount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
        Container(
            width: 10,
            height: constraints.maxHeight * 0.6,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: ttlspendingperc,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            )),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(height: constraints.maxHeight * 0.15, child: Text(label)),
      ]);
    });
  }
}
