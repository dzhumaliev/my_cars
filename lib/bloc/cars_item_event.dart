part of 'cars_item_bloc.dart';

@immutable
sealed class CarsItemEvent {}

class LoadCarsItems extends CarsItemEvent {}