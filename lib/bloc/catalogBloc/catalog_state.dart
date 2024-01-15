part of 'catalog_bloc.dart';

class CatalogState extends Equatable {
  final List<Category> categoryList;
  final List<List<Product>> productList;

  const CatalogState({
    required this.categoryList,
    required this.productList,
  });

  factory CatalogState.initial() => const CatalogState(
        categoryList: [],
        productList: [],
      );

  CatalogState copyWith(
      {final List<Category>? categoryList,
      final List<List<Product>>? productList}) {
    return CatalogState(
      categoryList: categoryList ?? this.categoryList,
      productList: productList ?? this.productList,
    );
  }

  @override
  List<Object?> get props => [categoryList, productList];
}
