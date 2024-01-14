class CatalogRepository{
    Future<List<CategoryModel>> GetCategorys() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse('http://10.0.2.2/sushi_server/api/objects/category/read.php'),
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

}

