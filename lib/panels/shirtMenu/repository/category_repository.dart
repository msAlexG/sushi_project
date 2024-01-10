import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sushi_project/panels/shirtMenu/model/category.dart';

class CategoryRepository {
  List<CategoryModel> categorys = [];

  Future<List<CategoryModel>> GetCategorys() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse(
            'http://localhost/sushi_server/api/objects/category/read.php'),
      );

      List result = jsonDecode(response.body);
      categorys = [];
      for (int i = 0; i < result.length; i++) {
        CategoryModel category =
            CategoryModel.fromJson(result[i] as Map<String, dynamic>);

        categorys.add(category);
      }

      return categorys;
    } catch (e) {
      log(e.toString());
      throw Exception("Failed to load category");
    }
  }

  Future<bool> AddCategory(
      {required String name, required String number}) async {
    var client = http.Client();

    final newCategory = {'id': '', 'name': name, 'number': number};
    try {
      var response = await client.post(
        Uri.parse(
            'http://localhost/sushi_server/api/objects/category/create.php'),
        body: jsonEncode(newCategory),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> DeleateCategory({required String id}) async {
    var client = http.Client();

    final newCategory = {'id': id};
    try {
      var response = await client.post(
        Uri.parse(
            'http://localhost/sushi_server/api/objects/category/deleate.php'),
        body: jsonEncode(newCategory),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> updateCategorys({
    required String id,
    required String name,
    required String number,
  }) async {
    var client = http.Client();

    final newCategory = {'id': id, 'name': name, 'number': number};
    try {
      var response = await client.post(
        Uri.parse(
            'http://localhost/sushi_server/api/objects/category/update.php'),
        body: jsonEncode(newCategory),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
