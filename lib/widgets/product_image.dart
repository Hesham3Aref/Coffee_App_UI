import 'package:flutter/material.dart';

import '../Utils/color.dart';
import '../models/product models.dart';



class ProductImage extends StatelessWidget {
  final Product product;
  const ProductImage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return SizedBox(
          height: constrain.maxWidth * 1.25,
          width: constrain.maxWidth,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: constrain.maxWidth,
                height: constrain.maxWidth*0.9,
                decoration:
                const BoxDecoration(color: thirdColor, shape: BoxShape.circle),
              ),
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(constrain.maxWidth * 0.45)),
                child: SizedBox(
                  width: constrain.maxWidth * .9,
                  height: constrain.maxWidth * 1.5,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Positioned(
                        bottom: -60,
                        width: constrain.maxWidth * .8,
                        height: constrain.maxWidth * 1.5,
                        child: Image.asset(
                          'assets/${product.image}',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}