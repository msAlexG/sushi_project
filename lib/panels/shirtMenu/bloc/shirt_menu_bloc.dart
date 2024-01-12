import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sushi_project/panels/shirtMenu/model/category.dart';
import 'package:sushi_project/panels/shirtMenu/repository/category_repository.dart';
part 'shirt_menu_event.dart';
part 'shirt_menu_state.dart';

class ShirtMenuBloc extends Bloc<ShirtMenuEvent, ShirtMenuState> {
  ShirtMenuBloc() : super(ShirtMenuInitial()) {
    on<ShirtMenuClicked>(_shirtMenuClicked);
    on<ShirtMenuGet>(_shirtMenuGet);
  }

  FutureOr<void> _shirtMenuClicked(
      ShirtMenuClicked event, Emitter<ShirtMenuState> emit) async {
    final _autoScrollController = event.autoScrollController;

    final index = event.index;

    await _autoScrollController.scrollToIndex(index,
        duration: const Duration(seconds: 1),
        preferPosition: AutoScrollPosition.begin);
  }

  FutureOr<void> _shirtMenuGet(
      ShirtMenuGet event, Emitter<ShirtMenuState> emit) async {
    emit(ShirtMenuLoading());

    try {
      final productRepository = CategoryRepository();
      final List<CategoryModel> product =
          await productRepository.GetCategorys();
      emit(ShirtMenuLoaded(category: product));
    } catch (_) {
      emit(ShirtMenuError());
    }
  }
}
