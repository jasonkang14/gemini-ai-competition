import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:location/location.dart';

class FoodDelivery extends StatefulWidget {
  const FoodDelivery({super.key});

  @override
  State<FoodDelivery> createState() => FoodDeliveryState();
}

class FoodDeliveryState extends State<FoodDelivery> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  TextEditingController controller = TextEditingController();

  static const CameraPosition _kSeoul = CameraPosition(
    target: LatLng(37.5665, 126.9780),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: _kSeoul,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        Marker(
          markerId: const MarkerId('Sokcho Fish'),
          position: const LatLng(37.562, 126.9782),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Sokcho Fish'),
                  content: SizedBox(
                    height: 400,
                    width: 400,
                    child: Column(
                      children: [
                        Image.network(
                            'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA2MTVfMjkw%2FMDAxNzE4NDE1MzQ2ODUw.sXVJLmPI62xT1TaHy_qchPwjl5hu0np5Af_3w3dAPA4g.X4m1KrlcYnSIXw4VXvJDbvM1jL0IVDLbs_WxxNpt8mwg.JPEG%2F20240614%25A3%25DF184139.jpg&type=sc960_832',
                            width: 240,
                            height: 240),
                        const SizedBox(height: 24),
                        const Text('Grilled Fish'),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        Marker(
          markerId: const MarkerId('Salad Moon'),
          position: const LatLng(37.5642, 126.9776),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Salad Moon'),
                  content: SizedBox(
                    height: 400,
                    width: 400,
                    child: Column(
                      children: [
                        Image.network(
                            'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDlfNyAg%2FMDAxNzA3NDUyODQyMjcz.zcrz4DSZhwRZlw5b6LuBCZ42KSq9gkOhhAusK9FzDl8g.hzbmYaTDclOaJuwLrdCWqFNauLbU1M0uvVaqOfGUEf8g.JPEG.happy2346%2F20240207%25A3%25DF192531.jpg&type=sc960_832',
                            width: 240,
                            height: 240),
                        const SizedBox(height: 24),
                        const Text('Avocado Salad'),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        Marker(
          markerId: const MarkerId('Fresh Credit'),
          position: const LatLng(37.5659, 126.98),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Fresh Credit'),
                  content: SizedBox(
                    height: 400,
                    width: 400,
                    child: Column(
                      children: [
                        Image.network(
                            'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA1MTJfMjMx%2FMDAxNjgzODY4ODA2ODk5.laYQrcsvBQyfVgkvuZMW1VDejrQev75lBJ-Ut8iDYKEg.Aw9e3_ohyfbiGyF6gO_7fGhw4Ypw0nLv8XjSIX4rTYAg.JPEG.oliverneaa%2F20230512_120303-1.jpg&type=a340',
                            width: 240,
                            height: 240),
                        const SizedBox(height: 24),
                        const Text('Quinoa Salad'),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      },
    );
  }
}
