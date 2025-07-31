
import 'package:flutter/material.dart';

import '../models/product models.dart';

class CategoryItems extends StatelessWidget {
  final Category category;
  const CategoryItems({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 65,
            width: 65,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/${category.image}',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            child: Text(
              category.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
