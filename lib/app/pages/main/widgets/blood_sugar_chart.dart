import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_hackathon/app/providers/firestore_provider.dart';
import 'package:intl/intl.dart';

class BloodSugarChart extends ConsumerWidget {
  const BloodSugarChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloodSugarFuture = ref.watch(bloodSugarLevelListProvider('jason_blood_sugar_levels'));

    return bloodSugarFuture.when(
      data: (bloodSugarList) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 300),
          child: LineChart(
            LineChartData(
              minY: 60,
              maxY: 150,
              lineTouchData: LineTouchData(
                touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                  if (event is FlTapUpEvent && touchResponse != null && touchResponse.lineBarSpots != null) {
                    final spot = touchResponse.lineBarSpots!.first;
                    final x = DateTime.fromMillisecondsSinceEpoch(spot.x.toInt());
                    final formattedX = DateFormat('yyyy-MM-dd HH:mm').format(x);
                    final y = spot.y;
                    // Handle the click event here
                    print('Clicked on: Date: $formattedX, Level: $y');
                  }
                },
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map((spot) {
                      final x = DateTime.fromMillisecondsSinceEpoch(spot.x.toInt());
                      final formattedX = DateFormat('yyyy-MM-dd HH:mm').format(x);
                      final y = spot.y;
                      return LineTooltipItem(
                        'Date: $formattedX\n Level: $y',
                        const TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  curveSmoothness: 2,
                  spots: bloodSugarList
                      .map((data) =>
                          FlSpot(data.timestamp.millisecondsSinceEpoch.toDouble(), data.level.roundToDouble()))
                      .toList(),
                  isCurved: false,
                  isStrokeCapRound: false,
                  barWidth: 2,
                  aboveBarData: BarAreaData(show: false),
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 44,
                    getTitlesWidget: (value, meta) {
                      final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                      final formattedDate = DateFormat('MM-dd').format(date);
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: Text(formattedDate, style: const TextStyle(fontSize: 10)),
                      );
                    },
                    interval: (bloodSugarList.last.timestamp.millisecondsSinceEpoch -
                            bloodSugarList.first.timestamp.millisecondsSinceEpoch) /
                        6,
                  ),
                ),
                show: true,
              ),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
