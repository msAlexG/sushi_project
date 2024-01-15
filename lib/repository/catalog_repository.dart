import 'package:sushi_project/models/catalog_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatalogRepository {
//CatalogModel catalog =CatalogModel(category: []);

  Future<CatalogModel> GetCatalog() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse('https://kr-builder.ru/sushi_test/new.json'),
      );
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));

      final List<dynamic> result = decoded['category'];

      final List<Category> categorys = result
          .map((rawCategorys) => Category.fromJson(rawCategorys))
          .toList();

      final CatalogModel catalog = CatalogModel(category: categorys);

      //final category = decoded['category'];

      return catalog;
    } catch (e) {
      throw Exception("Failed to load category");
    }
  }
}
