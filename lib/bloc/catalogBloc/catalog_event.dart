part of 'catalog_bloc.dart';

@immutable
sealed class CatalogEvent extends Equatable {
  const CatalogEvent();
}

class CatalogGet extends CatalogEvent {
  const CatalogGet();

  @override
  List<Object?> get props => [];
}

class ShirtMenuClicked extends CatalogEvent {
  final int menuIndex;
  final GlobalKey key;
  final AutoScrollController menuControler;
  final AutoScrollController catalogControler;
  final bool menuClickedState;
  const ShirtMenuClicked(
      {required this.catalogControler,
      required this.menuControler,
      required this.menuIndex,
      required this.key,
      required this.menuClickedState});

  @override
  List<Object?> get props => [menuIndex, key, menuControler, menuClickedState];
}

class MenuToggleClicked extends CatalogEvent {
  const MenuToggleClicked();

  @override
  List<Object?> get props => [];
}
