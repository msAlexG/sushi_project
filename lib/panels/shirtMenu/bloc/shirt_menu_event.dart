part of 'shirt_menu_bloc.dart';

@immutable
sealed class ShirtMenuEvent extends Equatable {
  const ShirtMenuEvent();
}

class ShirtMenuClicked extends ShirtMenuEvent {
  const ShirtMenuClicked();

  @override
  List<Object?> get props => [];
}

class ShirtMenuGet extends ShirtMenuEvent {
  const ShirtMenuGet();

  @override
  List<Object?> get props => [];
}
