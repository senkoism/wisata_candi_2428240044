import 'package:flutter/material.dart';

import '../models/candi.dart';

class ItemCard extends StatefulWidget {
  final Candi candi;
  const ItemCard({super.key, required this.candi});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      margin: const EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Hero(
            tag: candi.imageAsset,
            child: child

          ))
        ],
      ),
    );
  }
}
