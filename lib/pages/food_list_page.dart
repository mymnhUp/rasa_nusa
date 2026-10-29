
import 'package:flutter/material.dart';
import '../data/food_data.dart';
import '../widgets/food_card.dart';
import 'food_detail_page.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jelajahi Kuliner'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final food = foodList[index];

          return FoodCard(
            food: food,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(
                    food: food,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
