import 'package:flutter/material.dart';


class ChartCard extends StatelessWidget {
  const ChartCard({
    super.key, required this.widget,
  });
final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.5),
                blurRadius: 10,
                spreadRadius: 3,
              )
            ]),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget,
        ),
      ),
    );
  }

}


