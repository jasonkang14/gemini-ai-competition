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
                getTouchLineStart: (barData, spotIndex) => 0,
                getTouchLineEnd: (barData, spotIndex) => 0,
                touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                  if (event is FlTapUpEvent && touchResponse != null && touchResponse.lineBarSpots != null) {
                    final spot = touchResponse.lineBarSpots!.first;
                    final x = DateTime.fromMillisecondsSinceEpoch(spot.x.toInt());
                    final formattedX = DateFormat('yyyy-MM-dd HH:mm').format(x);
                    final y = spot.y;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Consumer(
                          builder: (context, ref, child) {
                            final dietFuture = ref.watch(dietProvider(formattedX));

                            return AlertDialog(
                              title: const Text('Diet Info'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date: $formattedX\nLevel: $y'),
                                  const SizedBox(height: 16),
                                  dietFuture.when(
                                    data: (diet) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Text('Calories: ${diet.calories}'),
                                          // const SizedBox(height: 16),
                                          diet.menuList.isNotEmpty
                                              ? Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Menu:',
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                    ...diet.menuList.asMap().entries.map((entry) {
                                                      final index = entry.key + 1;
                                                      final menu = entry.value;
                                                      return Text('$index. $menu');
                                                    }),
                                                  ],
                                                )
                                              : const Text('Menu: Not available'),
                                          const SizedBox(height: 16),
                                          diet.impactList.isNotEmpty
                                              ? Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Explanation:',
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                    ...diet.impactList.asMap().entries.map((entry) {
                                                      final index = entry.key + 1;
                                                      final menu = entry.value;
                                                      return Text('$index. $menu');
                                                    }),
                                                  ],
                                                )
                                              : const Text('Menu: Not available'),
                                        ],
                                      );
                                    },
                                    error: (error, stackTrace) {
                                      return const Text('Diet info does not exist');
                                    },
                                    loading: () => const CircularProgressIndicator(),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
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
