import 'package:flutter/material.dart';
import 'coffee_data.dart';

class CoffeeResultScreen extends StatelessWidget {
  final String coffeeType;

  const CoffeeResultScreen({super.key, required this.coffeeType});

  @override
  Widget build(BuildContext context) {
    final coffeeRecipe = coffeeRecipes[coffeeType];

    if (coffeeRecipe == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sonuç'),
        ),
        body: const Center(
          child: Text('Kahve tarifi bulunamadı.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(coffeeType),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              coffeeRecipe['image'] as String,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              coffeeRecipe['description'] as String,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Malzemeler:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            for (var ingredient in coffeeRecipe['ingredients'] as List<String>)
              Text(
                ingredient,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
