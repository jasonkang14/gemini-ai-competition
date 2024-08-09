import 'dart:typed_data';
import 'package:gemini_hackathon/app/providers/realtime_db_provider.dart';
import 'package:http/http.dart' as http;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_hackathon/app/providers/firestore_provider.dart';
import 'package:intl/intl.dart';

class BloodSugarChart extends ConsumerStatefulWidget {
  const BloodSugarChart({super.key});

  @override
  ConsumerState<BloodSugarChart> createState() => _BloodSugarChartState();
}

class _BloodSugarChartState extends ConsumerState<BloodSugarChart> {
  final gemini = Gemini.instance;
  final _prediction = [];

  final List<String> _imageList = [
    'https://firebasestorage.googleapis.com/v0/b/gemini-hackathon-51fbd.appspot.com/o/KakaoTalk_Photo_2024-07-30-05-21-37%20005.jpeg?alt=media&token=cdf1bb65-a442-427b-9176-9efc48747860',
    'https://firebasestorage.googleapis.com/v0/b/gemini-hackathon-51fbd.appspot.com/o/KakaoTalk_Photo_2024-07-30-05-21-38%20013.jpeg?alt=media&token=83f449ba-8523-4c8f-b559-ce087b6b458c',
    'https://firebasestorage.googleapis.com/v0/b/gemini-hackathon-51fbd.appspot.com/o/KakaoTalk_Photo_2024-07-30-05-21-37%20003.jpeg?alt=media&token=c3377bcf-c2f2-4d4b-820f-83e4177bd126',
  ];

  Future<List<Uint8List>> _fetchImages(List<String> urls) async {
    List<Uint8List> imageBytes = [];
    for (String url in urls) {
      try {
        final response = await http.get(Uri.parse(url));
        print('response: ${response.statusCode}');
        if (response.statusCode == 200) {
          imageBytes.add(response.bodyBytes);
        }
      } catch (e) {
        print('http error: $e');
      }
    }
    return imageBytes;
  }

  @override
  Widget build(BuildContext context) {
    // final bloodSugarFuture = ref.watch(bloodSugarLevelListProvider('jason_blood_sugar_levels'));
    final bloodSugarFuture = ref.watch(bloodSugarProvider);
    // print('hey: $hey');
    return bloodSugarFuture.when(
      data: (bloodSugarList) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: LineChart(
                LineChartData(
                  minY: 60,
                  maxY: 190,
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
                                  content: SizedBox(
                                    width: 480,
                                    height: 240,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 0,
                                          child: dietFuture.when(
                                            data: (diet) {
                                              return Image.network(
                                                diet.imagePath,
                                                width: 160,
                                                height: 140,
                                              );
                                            },
                                            error: (err, stt) => Container(),
                                            loading: () => Container(),
                                          ),
                                        ),
                                        Column(
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
                                      ],
                                    ),
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
                      spots: [
                        ...bloodSugarList.map((data) =>
                            FlSpot(data.timestamp.millisecondsSinceEpoch.toDouble(), data.level.roundToDouble())),
                        ..._prediction.map((data) => FlSpot(data['timestamp'].toDouble(), data['level'].toDouble())),
                      ],
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
                            3,
                      ),
                    ),
                    show: true,
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            Visibility(
              visible: false,
              child: ElevatedButton(
                onPressed: () async {
                  print(1);
                  final imagesBytes = await _fetchImages(_imageList);
                  print(2);

                  gemini
                      .textAndImage(
                          text: '''You are a doctor who can predict blood sugar level.
            Predict my Blood Sugar Level if I were to eat pasta and dessert for every meal on a regular basis. 
            Please return a list of Map where the keys are timestamp starting from august 6th and level which represents my blood sugar level.
            below is my blood sugar level chart. 
              $bloodSugarList''',
                          images: imagesBytes,
                          modelName: 'models/gemini-1.5-pro',
                          safetySettings: [
                            SafetySetting(category: SafetyCategory.dangerous, threshold: SafetyThreshold.blockNone),
                          ])
                      .then((value) => print(value?.content?.parts?.last.text ?? ''))
                      .catchError((e) => print('textAndImageInput: $e'));
                },
                child: const Text('Predict Blood Sugar Level'),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
