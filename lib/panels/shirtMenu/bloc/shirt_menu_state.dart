part of 'shirt_menu_bloc.dart';

@immutable
sealed class ShirtMenuState extends Equatable {
  const ShirtMenuState();
  @override
  List<Object> get props => [];
}

final class ShirtMenuInitial extends ShirtMenuState {}

final class ShirtMenuLoading extends ShirtMenuState {}

final class ShirtMenuError extends ShirtMenuState {}

final class ShirtMenuLoaded extends ShirtMenuState {
  ShirtMenuLoaded({required this.category});

  final List<CategoryModel> category;

  @override
  List<Object> get props => [category];
}
