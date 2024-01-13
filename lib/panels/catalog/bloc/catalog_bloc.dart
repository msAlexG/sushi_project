import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:sushi_project/panels/shirtMenu/model/category.dart';
import 'package:sushi_project/panels/shirtMenu/repository/category_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';
//
class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogState.initial()) {
    on<CatalogGet>(_catalogGet);
  }

  FutureOr<void> _catalogGet(
      CatalogGet event, Emitter<CatalogState> emit) async {
    try {
      final catalorRepository = CategoryRepository();
      final List<CategoryModel> catalog =
          await catalorRepository.GetCategorys();
      emit(
        state.copyWith(categoryList: catalog),
      );
    } catch (_) {
      print('error');
    }
  }
}
