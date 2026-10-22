import 'package:flutter/material.dart';
import 'package:wisata_candi_dart/screens/profile_screen.dart';
// import 'package:wisata_candi_dart/data/candi_data.dart';
// import 'package:wisata_candi_dart/screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
      // home: DetailScreen(candi: candiList[0]),
    );
  }
}
