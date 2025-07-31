
import 'package:flutter/material.dart';
import '../Utils/color.dart';

import '../models/product models.dart';
import '../models/size_options_model.dart';
import '../widgets/background.dart';
import '../widgets/product_image.dart';
import '../widgets/size_option_item.dart';
import 'cart_page.dart';


class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedSize = 2;
  int quantity = 1;



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.amberAccent,
                ),
                Positioned(
                  right: 2,
                  top: 1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                        color: firstColor, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: Stack(children: [
       const BackGroundApp(),
        Positioned(
          left: 20,
          right: 20,
          child: Column(
            children: [
              Hero(
                tag: widget.product.name,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.81,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ProductImage(product: widget.product),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Text(
                        widget.product.name,
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: firstColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        const Text(
                          'Best Sales',
                          style: TextStyle(
                              color: Colors.black45, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Size Options',
                    style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      List.generate(sizeOptions.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = index;
                            });
                          },
                          child: SizeOptionItem(
                            index: index,
                            selected: selectedSize == index ? true : false,
                            sizeOption: sizeOptions[index],
                          ),
                        );
                      })

                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: secondColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: 20,

                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: secondColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(firstColor)),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          CartPage.routeName,
                        );
                      },
                      child: Text('Go to Cart',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}