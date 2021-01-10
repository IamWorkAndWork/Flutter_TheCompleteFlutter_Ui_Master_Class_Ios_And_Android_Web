import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  const BarChart({this.expenses});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Text(
            "Weekly Spending",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  onPressed: () {}),
              Text("Novv 10, 2019 - Nov 16, 2019",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  )),
              IconButton(
                  iconSize: 30.0,
                  icon: Icon(
                    Icons.arrow_forward,
                  ),
                  onPressed: () {})
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Bar(
                  label: "Su",
                  amountSpend: expenses[0],
                  mostExpensive: mostExpensive),
              Bar(
                  label: "Mo",
                  amountSpend: expenses[1],
                  mostExpensive: mostExpensive),
              Bar(
                  label: "TU",
                  amountSpend: expenses[2],
                  mostExpensive: mostExpensive),
              Bar(
                  label: "WE",
                  amountSpend: expenses[3],
                  mostExpensive: mostExpensive),
              Bar(
                  label: "TH",
                  amountSpend: expenses[4],
                  mostExpensive: mostExpensive),
              Bar(
                  label: "FR",
                  amountSpend: expenses[5],
                  mostExpensive: mostExpensive),
              Bar(
                  label: "SA",
                  amountSpend: expenses[6],
                  mostExpensive: mostExpensive)
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpend;
  final double mostExpensive;
  final double _maxBarHeight = 150.0;

  const Bar({this.label, this.amountSpend, this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpend / mostExpensive * _maxBarHeight;
    return Column(
      children: <Widget>[
        Text(
          "\$${amountSpend.toStringAsFixed(2)}",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6.0,
        ),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6.0)),
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
