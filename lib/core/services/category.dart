import 'package:store_app/core/error/excption.dart';
import 'package:store_app/core/network/api_client.dart';
import 'package:store_app/core/network/api_config.dart';
import 'package:store_app/features/data/models/product_model.dart';

class Category {
  Future<dynamic> category(String categoryName) async {
    try {
      final response = await ApiClient().get(
        url: "${ApiConfig.categories}$categoryName",
      );
      List<ProductModel> category = [];
      for (var element in response) {
        category.add(ProductModel.fromjson(element));
      }
      return category;
    } catch (e) {
      ExcptionHandler().handelExcption(e);
    }
  }
}
