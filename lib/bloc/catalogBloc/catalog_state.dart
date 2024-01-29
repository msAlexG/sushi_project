part of 'catalog_bloc.dart';

class CatalogState extends Equatable {
  final List<Category> categoryList;
  final List<GlobalKey> keys;
  final int carentMenuIndex;
  final List<List<Product>> productList;

  final bool menuClicked;

  const CatalogState({
    required this.categoryList,
    required this.productList,
    required this.carentMenuIndex,
    required this.menuClicked,
    required this.keys,
  });

  factory CatalogState.initial() => const CatalogState(
        categoryList: [],
        productList: [],
        carentMenuIndex: 0,
        menuClicked: false,
        keys: [],
      );

  CatalogState copyWith({
    final List<Category>? categoryList,
    final List<List<Product>>? productList,
    final int? carentMenuIndex,
    final bool? menuClicked,
    final List<GlobalKey>? keys,
  }) {
    return CatalogState(
      categoryList: categoryList ?? this.categoryList,
      productList: productList ?? this.productList,
      carentMenuIndex: carentMenuIndex ?? this.carentMenuIndex,
      menuClicked: menuClicked ?? this.menuClicked,
      keys: keys ?? this.keys,
    );
  }

  @override
  List<Object?> get props =>
      [categoryList, productList, carentMenuIndex, menuClicked, keys];
}
