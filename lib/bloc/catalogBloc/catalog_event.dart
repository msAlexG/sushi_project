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
