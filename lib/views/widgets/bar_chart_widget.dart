import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../services/models/chart_sample_data.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bar Chart',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: const Color(0XFF003b6d),),
        ),
        SfCartesianChart(
          plotAreaBorderWidth: 0,
          enableAxisAnimation: true,
          primaryXAxis: CategoryAxis(),
          primaryYAxis: CategoryAxis(),
          series: _getTrackerBarSeries(),
        ),
      ],
    );
  }

    List<BarSeries<ChartSampleData, String>> _getTrackerBarSeries() {
    return <BarSeries<ChartSampleData, String>>[
      BarSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Mike', y: 7.5),
          ChartSampleData(x: 'Chris', y: 7),
          ChartSampleData(x: 'Helana', y: 6),
          ChartSampleData(x: 'Tom', y: 5),
          ChartSampleData(x: 'Federer', y: 7),
          ChartSampleData(x: 'Hussain', y: 7),
        ],
        borderRadius: BorderRadius.circular(15),
        

        color: const Color(0XFFca2f2f),
        isTrackVisible: false,
        
        dataLabelSettings: const DataLabelSettings(
          labelPosition: ChartDataLabelPosition.outside,
            isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
    ];
  }
}