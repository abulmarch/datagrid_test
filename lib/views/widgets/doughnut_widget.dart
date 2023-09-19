import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../services/models/chart_sample_data.dart';


class DoughnutWidget extends StatelessWidget {
  const DoughnutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Doughnut Chart',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color:const Color(0XFF003b6d),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  SfCircularChart(
                    centerX: '45%',
                  series: _getDefaultDoughnutSeries(),
                ),
                Positioned(
                  left: 80,
                  child: RichText(
                  text: const TextSpan(
                    text: '274\n',
                    style: TextStyle(
                      color: Color(0XFF003b6d),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: 'Total',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                            ),
                ),
                ]),
            ),
          Expanded(
            flex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
                  children: [
            buildComponent('Chlorine', '55%', const Color(0XFF4b87b9)),
            buildComponent('Sodium', '31%',  const Color(0XFFc06c84)),
            buildComponent('Magnesium', '7.7%', const Color(0XFFf67280)),
            buildComponent('Sulfur', '10.7%', const Color(0XFFf8b195)),
                  ],
            ),
          )
          ],
        ),
      ],
    );
  }
  Widget buildComponent(String label, String percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle
            ),
          ),
          const SizedBox(width: 4.0),
          Text(
            percentage,
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w700,
              color: Color(0XFF003b6d),
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          
        ],
      ),
    );
  }
List<DoughnutSeries<ChartSampleData, String>> _getDefaultDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        
        animationDuration: 2,
          radius: '80%',
          innerRadius: '65%',
          explode: true,
          explodeOffset: '10%',
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Chlorine', y: 56, text: '55%'),
            ChartSampleData(x: 'Sodium', y: 31, text: '31%'),
            ChartSampleData(x: 'Magnesium', y: 7.7, text: '7.7%'),
            ChartSampleData(x: 'Sulfur', y: 10.7, text: '10.7%'),
            
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          
          )
    ];
  }
    
}