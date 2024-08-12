import 'package:flutter/material.dart';
import 'package:gemini_hackathon/app/pages/main/widgets/blood_sugar_chart.dart';
import 'package:gemini_hackathon/app/pages/main/widgets/diet_management.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  static const List<Widget> _widgetOptions = [
    BloodSugarChart(),
    DietManagement(),
  ];

  static const List<String> _titleList = [
    'Blood Sugar Level',
    'Diet Management',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleList.elementAt(_selectedIndex)),
      ),
      body: Row(
        children: [
          NavigationRail(
            labelType: labelType,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.show_chart_outlined),
                selectedIcon: Icon(Icons.show_chart_rounded),
                label: Text('Sugar Level'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.dining_outlined),
                selectedIcon: Icon(Icons.dining_rounded),
                label: Text('Diet'),
              ),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIndex: _selectedIndex,
          ),
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}
