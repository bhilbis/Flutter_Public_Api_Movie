import 'package:flutter/material.dart';
import 'package:flutter_api_movie/pages/movie_list.dart';
import 'package:flutter_api_movie/movie_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieFlutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieBottomBar(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MovieList(category: 'popular');
  }
}
