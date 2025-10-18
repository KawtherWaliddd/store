import 'package:store_app/core/error/excption.dart';
import 'package:store_app/core/network/api_client.dart';
import 'package:store_app/core/network/api_config.dart';
import 'package:store_app/features/data/models/product_model.dart';

class AllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await ApiClient().get(url: ApiConfig.products);

      final List<ProductModel> products = [];
      for (var product in response as List) {
        products.add(ProductModel.fromjson(product));
      }

      return products;
    } catch (e) {
      ExcptionHandler().handelExcption(e);
      rethrow;
    }
  }
}
