import 'package:flutter/material.dart';
import 'package:store_app/core/services/all_products.dart';
import 'package:store_app/features/data/models/product_model.dart';
import 'package:store_app/features/presentation/home/widgets/card_item.dart';
import 'package:store_app/features/presentation/login/views/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ProductModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = AllProducts().getAllProducts(); // تحميل أول مرة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Trendy App",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<ProductModel> products = snapshot.data!;
            return GridView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.only(
                top: 100,
                left: 12,
                right: 12,
                bottom: 12,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 100,
                crossAxisSpacing: 25,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      "UpdateScreen",
                      arguments: products[index],
                    );
                    if (result == true) {
                      setState(() {
                        _productsFuture = AllProducts()
                            .getAllProducts(); // تحديث البيانات
                      });
                    }
                  },
                  child: CardItem(productModel: products[index]),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Has Error'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
