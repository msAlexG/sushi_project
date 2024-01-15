import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:sushi_project/models/catalog_model.dart';

import 'package:sushi_project/repository/catalog_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogState.initial()) {
    on<CatalogGet>(_catalogGet);
  }

  FutureOr<void> _catalogGet(
      CatalogGet event, Emitter<CatalogState> emit) async {
    try {
      final catalorRepository = CatalogRepository();

      final CatalogModel catalog = await catalorRepository.GetCatalog();
      final List<Category> categorys = catalog.category;

      final List<List<Product>> products = [];
      categorys.forEach((category) => products.add(category.products));

      emit(
        state.copyWith(categoryList: categorys, productList: products),
      );
    } catch (_) {
      emit(
        state.copyWith(categoryList: []),
      );
      print('error');
    }
  }
}
