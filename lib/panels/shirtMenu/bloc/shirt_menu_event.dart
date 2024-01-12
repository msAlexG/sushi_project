part of 'shirt_menu_bloc.dart';

@immutable
sealed class ShirtMenuEvent extends Equatable {
  const ShirtMenuEvent();
}

class ShirtMenuClicked extends ShirtMenuEvent {
  final int index;
  final AutoScrollController autoScrollController;
  const ShirtMenuClicked(this.index, this.autoScrollController);

  @override
  List<Object?> get props => [index];
}

class ShirtMenuGet extends ShirtMenuEvent {
  const ShirtMenuGet();

  @override
  List<Object?> get props => [];
}
