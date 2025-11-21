import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cars_item_event.dart';
part 'cars_item_state.dart';

class CarsItemBloc extends Bloc<CarsItemEvent, CarsItemState> {
  CarsItemBloc() : super(CarsItemInitial()) {
    on<CarsItemEvent>((event, emit) async {
      emit(CarsItemLoading([]));

      try {
        // Simulate a delay for loading items
        await Future.delayed(const Duration(seconds: 2));
        // Simulate loaded items
        final items = [
          "Honda CBR600",
          "Yamaha R1",
          "Suzuki GSX-R750",
          "Kawasaki Ninja 636",
        ];
        emit(CarsItemLoading(items));
      } catch (e) {
        emit(CarsItemsError('Failed to load car items'));
      }
    });
  }
}
