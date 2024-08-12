import 'dart:typed_data';
import 'package:gemini_hackathon/app/pages/main/widgets/diet_info_alert.dialog.dart';
import 'package:gemini_hackathon/app/pages/main/widgets/item_image_view.dart';
import 'package:gemini_hackathon/app/providers/ai_provider.dart';
import 'package:gemini_hackathon/app/providers/realtime_db_provider.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_hackathon/app/providers/firestore_provider.dart';
import 'package:gemini_hackathon/app/providers/storage_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class BloodSugarChart extends ConsumerStatefulWidget {
  const BloodSugarChart({super.key});

  @override
  ConsumerState<BloodSugarChart> createState() => _BloodSugarChartState();
}

class _BloodSugarChartState extends ConsumerState<BloodSugarChart> {
  final ImagePicker picker = ImagePicker();
  final gemini = Gemini.instance;
  final _prediction = [];
  String dietInfo = 'Please let me know what you had for your meal.';
  List<Uint8List>? images;

  @override
  Widget build(BuildContext context) {
    final bloodSugarFuture = ref.watch(bloodSugarProvider);
    final gemini = ref.watch(aIProvider.notifier);

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

                                return dietFuture.when(
                                  data: (diet) {
                                    return DietInfoAlertDialog(
                                      formattedX: formattedX,
                                      y: y,
                                      diet: diet,
                                    );
                                  },
                                  error: (error, stackTrace) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          title: const Text('Upload Diet Info'),
                                          content: SizedBox(
                                            height: 300,
                                            child: GeminiResponseTypeView(
                                              builder: (context, child, response, loading) {
                                                if (loading) {
                                                  return const Center(
                                                    child: CircularProgressIndicator(
                                                      color: Colors.blueAccent,
                                                    ),
                                                  );
                                                }

                                                return images == null
                                                    ? const Center(child: CircularProgressIndicator())
                                                    : Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            height: 120,
                                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                                            alignment: Alignment.centerLeft,
                                                            child: Card(
                                                              child: ItemImageView(
                                                                bytes: images![0],
                                                              ),
                                                            ),
                                                          ),
                                                          Text(dietInfo),
                                                        ],
                                                      );
                                              },
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Upload'),
                                              onPressed: () async {
                                                picker.pickMultiImage().then((value) async {
                                                  final imagesBytes = <Uint8List>[];
                                                  String filename = '';
                                                  for (final file in value) {
                                                    imagesBytes.add(await file.readAsBytes());
                                                    filename = file.name;
                                                  }

                                                  if (imagesBytes.isNotEmpty) {
                                                    final aiMessage = await gemini.askWithImage(
                                                      userMessage:
                                                          'If I were to eat this, what impact would this have on my blood sugar? Answer in 4-5 sentences',
                                                      images: imagesBytes,
                                                    );

                                                    setState(() {
                                                      dietInfo = aiMessage;
                                                      images = imagesBytes;
                                                    });

                                                    final storageNotifier = ref.read(storageProvider.notifier);
                                                    final remoteImagePath = await storageNotifier.uploadToStorage(
                                                      imageBytes: imagesBytes[0],
                                                      filename: filename,
                                                    );
                                                    final firestoreNotifier = ref.read(firestoreProvider.notifier);
                                                    await firestoreNotifier.uploadToFirestore(
                                                      analysis: aiMessage,
                                                      imagePath: remoteImagePath,
                                                    );
                                                  }
                                                });
                                              },
                                            ),
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
                                  loading: () => const Center(child: CircularProgressIndicator()),
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
          ],
        );
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
