import 'package:flutter/material.dart';
import 'package:flutter_fun_app/screens/random_color_class.dart';
import 'package:flutter_fun_app/screens/random_images.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FunApp(),
    );
  }
}

class FunApp extends StatefulWidget {
  const FunApp({super.key});

  @override
  State<FunApp> createState() => _FunAppState();
}

class _FunAppState extends State<FunApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                const Text("Fun App", style: TextStyle(color: Colors.black))),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const RandomImages();
                      },
                    ));
                  },
                  child: const Text("Get Random Images")),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const RandomColorClass();
                      },
                    ));
                  },
                  child: const Text("Random Color Generator")),
            ],
          ),
        ));
  }
}
