import 'package:flutter/material.dart';
import 'package:gemini_hackathon/app/models/diet.dart';

class DietInfoAlertDialog extends StatelessWidget {
  const DietInfoAlertDialog({
    super.key,
    required this.formattedX,
    required this.y,
    required this.diet,
  });

  final String formattedX;
  final double y;
  final Diet diet;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Diet Info'),
      content: SizedBox(
        width: 480,
        height: 240,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Image.network(
                diet.imagePath,
                width: 160,
                height: 140,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: $formattedX\nLevel: $y'),
                const SizedBox(height: 16),
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
                    : const Text('Explanation: Not available'),
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
  }
}
