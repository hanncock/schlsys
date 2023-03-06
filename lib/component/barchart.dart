import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class BarChartComponent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        alignment: BarChartAlignment.spaceBetween,
        // axisTitleData: FlAxisTitleData(leftTitle:AxisTitles(reversedSize: 20)),
        gridData: FlGridData(drawHorizontalLine: true,horizontalInterval: 20),
        // titlesData: FlTitlesData(
        //     leftTitles: SideTitles(
        //         reservedSize: 30,
        //         getTextStyles: (value) => const TexStyle(color: Colors.grey))
        // ),
        barGroups: [
          BarChartGroupData(
              x: 0,
            barRods: [
              BarChartRodData(
                  toY: 10,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0),
                  width: 40,
                  backDrawRodData: BackgroundBarChartRodData(toY:90, show: true,color: AppColors.barBg)
              ),
              BarChartRodData(
                  toY: 10,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0),
                  width: 40,
                  backDrawRodData: BackgroundBarChartRodData(toY:90, show: true,color: AppColors.barBg)
              ),
              BarChartRodData(
                  toY: 10,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0),
                  width: 40,
                  backDrawRodData: BackgroundBarChartRodData(toY:90, show: true,color: AppColors.barBg)
              ),
            ]
          ),
        ]
      )
    );
  }
}