import 'package:flutter/material.dart';
import 'package:wisata_candi_dart/data'
import 'package:wisata_candi_dart/models/';
import 'package:wisata_candi_dart/widgets/'

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wisata Candi')),
      body: GridView.builder(
        gridDelegate: gridDelegate,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
