import 'package:flutter/material.dart';
import 'package:market_app/feature/note/domain/entities/getir_yemek_categories.dart';

class FoodKitchenItem extends StatelessWidget {
  const FoodKitchenItem({super.key, required this.categories});

  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 75,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(categories.toImage),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              top: 120,
            ),
            child: Text(
              categories.toText,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
