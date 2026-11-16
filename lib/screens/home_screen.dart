import 'package:flutter/material.dart';
import '../data/candi_data.dart';
import '../widgets/item_card.dart';

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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: candiList.length,
        itemBuilder: (context, index) {
          return ItemCard(candi: candiList[index]);
        },
      ),
    );
  }
}
