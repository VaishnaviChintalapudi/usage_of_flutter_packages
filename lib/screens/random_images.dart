import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RandomImages extends StatefulWidget {
  const RandomImages({super.key});

  @override
  State<RandomImages> createState() => _RandomImagesState();
}

class _RandomImagesState extends State<RandomImages> {
  final Dio _dio = Dio();
  String? imageUrl;

  Future<String> _getRandomImage() async {
    await _dio.get("https://api.thecatapi.com/v1/images/search").then((value) {
      if (value.statusCode == 200) {
        if (value.data != null && value.data.toString().isNotEmpty) {
          if (value.data.runtimeType == List) {
            if (value.data[0].containsKey("url")) {
              String? imageData = value.data[0]["url"];
              if (imageData != null && imageData.isNotEmpty) {
                imageUrl = imageData;
              }
            }
          }
        }
      } else {
        throw Exception("Something went wrong");
      }
    }).onError((error, stackTrace) {
      throw Exception(error.toString());
    }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        throw Exception("Api timeout");
      },
    );

    return imageUrl!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Catty",
            style: TextStyle(color: Colors.black, fontSize: 20)),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: _getRandomImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error} occured"),
                    );
                  } else if (snapshot.hasData) {
                    final data = snapshot.data as String;
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue)),
                    );
                  }
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
