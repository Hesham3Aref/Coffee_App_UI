import 'package:flutter/material.dart';
import '../models/product models.dart';


class CartPage extends StatefulWidget {
  static const routeName = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Product> items;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    items = List.from(ModalRoute.of(context)!.settings.arguments as List<Product>);
  }

  void _removeItem(Product p) {
    setState(() => items.remove(p));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: items.isEmpty
          ? const Center(child: Text('Cart is empty'))
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, i) {
          final item = items[i];
          return ListTile(
            leading: Image.asset(item.image, width: 50, height: 50),
            title: Text(item.name),
            subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () => _removeItem(item),
            ),
          );
        },
      ),
    );
  }
}