import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:memes_api/pages/home_page.dart';
import 'package:memes_api/pages/list_page.dart';

import 'models/local_meme.dart';

void main() async {
  await Hive.initFlutter();
  
  Hive.registerAdapter(LocalMemeAdapter());

  await Hive.openBox<LocalMeme>('favorites_memes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memes List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const homePage(),
    );
  }
}