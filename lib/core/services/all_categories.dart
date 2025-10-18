import 'package:store_app/core/error/excption.dart';
import 'package:store_app/core/network/api_client.dart';
import 'package:store_app/core/network/api_config.dart';

class AllCategories {
  Future<dynamic> allProducts() async {
    try {
      final response = await ApiClient().get(url: ApiConfig.categories);
      return response;
    } catch (e) {
      ExcptionHandler().handelExcption(e);
    }
  }
}
