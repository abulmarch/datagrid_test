// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:datagrid_test/views/widgets/bar_chart_widget.dart';
import 'package:datagrid_test/views/widgets/doughnut_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'widgets/chart_card.dart';

class DetailPage extends StatelessWidget {
  final DataGridRow row;
  const DetailPage({
    Key? key,
    required this.row,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = row.getCells();
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0XFF2c7073)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    data[1].value.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data[2].value.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const ChartCard(widget: BarChartWidget()),
            const SizedBox(
              height: 30,
            ),
            const ChartCard(widget: DoughnutWidget()),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
