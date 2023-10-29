// ignore_for_file: missing_required_param

import 'package:store_app/Helper/Api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
