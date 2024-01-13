part of 'catalog_bloc.dart';

class CatalogState extends Equatable {
  final List<CategoryModel> categoryList;

  const CatalogState({
    required this.categoryList,
  });

  factory CatalogState.initial() => const CatalogState(
        categoryList: [],
      );

  CatalogState copyWith({
    final List<CategoryModel>? categoryList,
  }) {
    return CatalogState(
      categoryList: categoryList ?? this.categoryList,
    );
  }

  @override
  List<Object?> get props => [
        categoryList,
      ];
}
