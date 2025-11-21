import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cars/bloc/cars_item_bloc.dart';

class CarsListPage extends StatelessWidget {
  const CarsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Example')),
      body: BlocBuilder<CarsItemBloc, CarsItemState>(
        builder: (context, state) {
          if (state is CarsItemLoading && state.allItems.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is CarsItemLoading) {
            return ListView.builder(
              itemCount: state.allItems.length,
              itemBuilder: (_, index) {
                return ListTile(title: Text(state.allItems[index]));
              },
            );
          }

          if (state is CarsItemsError) {
            return Center(child: Text(state.message));
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
