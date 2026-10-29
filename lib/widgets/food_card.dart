
import 'package:flutter/material.dart';
import '../models/food.dart';
import '../services/food_image_service.dart';

class FoodImage extends StatelessWidget {
  final Food food;
  final double height;
  final double? width;

  const FoodImage({
    super.key,
    required this.food,
    required this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: FoodImageService().getImageUrl(
        food.kataKunciGambar,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return Container(
            height: height,
            width: width,
            color: Colors.orange.shade50,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final url = snapshot.data;

        if (url == null || url.isEmpty) {
          return Container(
            height: height,
            width: width,
            color: Colors.orange.shade50,
            child: const Icon(
              Icons.restaurant,
              size: 42,
              color: Colors.deepOrange,
            ),
          );
        }

        return Image.network(
          url,
          height: height,
          width: width,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: height,
              width: width,
              color: Colors.orange.shade50,
              child: const Icon(Icons.restaurant),
            );
          },
        );
      },
    );
  }
}

class FoodCard extends StatelessWidget {
  final Food food;
  final VoidCallback onTap;

  const FoodCard({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodImage(
              food: food,
              height: 110,
              width: 115,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.nama,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(food.asal),
                    const SizedBox(height: 8),
                    const Text(
                      'Lihat detail →',
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
