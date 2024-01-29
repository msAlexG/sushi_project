import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sushi_project/models/catalog_model.dart';

import 'package:sushi_project/repository/catalog_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogState.initial()) {
    on<CatalogGet>(_catalogGet);
    on<ShirtMenuClicked>(_shirtMenuClicked);
    on<MenuToggleClicked>(_menuClickedState);
  }

  FutureOr<void> _shirtMenuClicked(
      ShirtMenuClicked event, Emitter<CatalogState> emit) async {
    final key = event.key;
    final menuControler = event.menuControler;
    final index = event.menuIndex;
    final menuClickedState = event.menuClickedState;

    if (menuClickedState == false) {
      if (state.menuClicked == false) {
        emit(state.copyWith(menuClicked: false));
        emit(state.copyWith(carentMenuIndex: index));

        await menuControler.scrollToIndex(index,
            duration: const Duration(milliseconds: 700),
            preferPosition: AutoScrollPosition.middle);
      } else {}
    } else {
      emit(state.copyWith(menuClicked: true));
      emit(state.copyWith(carentMenuIndex: index));
      await menuControler.scrollToIndex(index,
          duration: const Duration(milliseconds: 700),
          preferPosition: AutoScrollPosition.middle);

      await Scrollable.ensureVisible(
        key.currentContext!,
        // duration for scrolling time
        alignment: 0, // 0 mean, scroll to the top, 0.5 mean, half
        curve: Curves.linear,

        duration: const Duration(milliseconds: 1000),
      );
    }
  }

  FutureOr<void> _catalogGet(
      CatalogGet event, Emitter<CatalogState> emit) async {
    try {
      final catalorRepository = CatalogRepository();

      final CatalogModel catalog = await catalorRepository.GetCatalog();
      final List<Category> categorys = catalog.category;
      final List<GlobalKey> keys = [];
      final List<List<Product>> products = [];

      categorys.forEach((category) => products.add(category.products));

      categorys.forEach((category) =>
          keys.add(GlobalKey(debugLabel: "key_${category.name}")));

      emit(state.copyWith(
          categoryList: categorys, productList: products, keys: keys));
    } catch (_) {
      emit(state.copyWith(categoryList: [], productList: [], keys: []));
      print('error');
    }
  }

  FutureOr<void> _menuClickedState(
      MenuToggleClicked event, Emitter<CatalogState> emit) {
    emit(state.copyWith(menuClicked: false));
  }
}
