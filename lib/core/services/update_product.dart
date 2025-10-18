import 'dart:developer';

import 'package:store_app/core/error/excption.dart';
import 'package:store_app/core/network/api_client.dart';
import 'package:store_app/core/network/api_config.dart';

class UpdateProduct {
  Future<void> updateProduct({
    required int id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    try {
      final response = await ApiClient().put(
        url: '${ApiConfig.baseUrl}${ApiConfig.products}/$id',
        data: {
          "title": title,
          "price": price,
          "description": description,
          "image": image,
          "category": category,
        },
      );

      log("Product updated: $response");
    } catch (e) {
      ExcptionHandler().handelExcption(e);
      rethrow;
    }
  }
}
