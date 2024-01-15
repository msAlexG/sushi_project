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
  final int index;
  final AutoScrollController autoScrollController;
  const ShirtMenuClicked(this.index, this.autoScrollController);

  @override
  List<Object?> get props => [index];
}
