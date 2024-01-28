// busshitunokousei.dart
import 'package:flutter/material.dart';

class BusshitunokouseiPage extends StatelessWidget {
  const BusshitunokouseiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busshitunokousei'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(200, 200)),
              ),
              child: const Text('物質の構成'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(200, 200)),
              ),
              child: const Text('物質の構成粒子'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(200, 200)),
              ),
              child: const Text('粒子の結合'),
            ),
          ],
        ),
      ),
    );
  }
}
