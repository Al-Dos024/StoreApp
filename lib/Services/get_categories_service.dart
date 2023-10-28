import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/Helper/Api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCateogires() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
