import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

class RandomColorClass extends StatefulWidget {
  const RandomColorClass({super.key});

  @override
  State<RandomColorClass> createState() => _RandomColorState();
}

class _RandomColorState extends State<RandomColorClass> {
  Color? flutterColor;

  _getRandomColor() {
    setState(() {
      flutterColor = RandomColor.getColorObject(
              Options(colorType: ColorType.random, luminosity: Luminosity.dark))
          .withOpacity(0.5);
    });
  }

  @override
  void initState() {
    _getRandomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Color",
            style: TextStyle(color: Colors.black, fontSize: 20)),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: flutterColor,
              radius: 100,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  _getRandomColor();
                },
                child: const Text("Get some random color"))
          ],
        ),
      ),
    );
  }
}
