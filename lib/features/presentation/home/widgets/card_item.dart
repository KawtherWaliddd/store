import 'package:flutter/material.dart';
import 'package:store_app/features/data/models/product_model.dart';
import 'package:store_app/features/presentation/update_product/view/update_screen.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          UpdateScreen.id,
          arguments: productModel,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 170,
              width: 210,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    spreadRadius: 0.5,
                    offset: Offset(0, 4),
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${productModel.price}\$",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 130,
              right: 5,
              child: Image.network(productModel.image!, width: 80, height: 150),
            ),
          ],
        ),
      ),
    );
  }
}
