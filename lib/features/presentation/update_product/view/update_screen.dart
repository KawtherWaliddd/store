import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/services/update_product.dart';
import 'package:store_app/features/data/models/product_model.dart';
import 'package:store_app/features/presentation/update_product/widgets/cusstom_button.dart';
import 'package:store_app/features/presentation/update_product/widgets/custom_text_field_prosuct.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});
  static String id = "UpdateScreen";

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? productName, des, imageUrl;
  double? price;

  bool isLoading = false;

  late TextEditingController nameController;
  late TextEditingController descController;
  late TextEditingController priceController;
  late TextEditingController imageController;

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    priceController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    nameController = TextEditingController(text: product.title);
    descController = TextEditingController(text: product.description);
    priceController = TextEditingController(text: product.price.toString());
    imageController = TextEditingController(text: product.image);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Update Products",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFieldproduct(
                    controller: nameController,
                    input: "Product Name",
                    onChanged: (data) {
                      productName = data;
                    },
                    keyBoardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  CustomTextFieldproduct(
                    controller: descController,
                    input: "Description",
                    onChanged: (data) {
                      des = data;
                    },
                    keyBoardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  CustomTextFieldproduct(
                    controller: priceController,
                    input: "Price",
                    onChanged: (data) {
                      try {
                        price = double.parse(data);
                      } catch (e) {
                        price = product.price;
                      }
                    },
                    keyBoardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  CustomTextFieldproduct(
                    controller: imageController,
                    input: "Image URL",
                    onChanged: (data) {
                      imageUrl = data;
                    },
                    keyBoardType: TextInputType.url,
                  ),
                  SizedBox(height: 20),
                  CusstomButton(
                    title: "Update Product",
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      try {
                        await updateProduct(product);

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Product updated successfully"),
                              backgroundColor: Colors.green,
                            ),
                          );

                          Navigator.pop(context, true);
                        }
                      } catch (e) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("has Error: $e"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      } finally {
                        if (mounted) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
      id: product.id!,
      title: productName ?? product.title!,
      price: price ?? product.price!,
      description: des ?? product.description!,
      image: imageUrl ?? product.image!,
      category: product.category!,
    );
  }
}
