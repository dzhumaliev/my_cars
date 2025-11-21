part of 'cars_item_bloc.dart';

@immutable
sealed class CarsItemState {}

final class CarsItemInitial extends CarsItemState {}

class CarsItemLoading extends CarsItemState {
  final List<String> allItems;
  CarsItemLoading(this.allItems);
}

class CarsItemsError extends CarsItemState {
  final String message;
  CarsItemsError(this.message);
}