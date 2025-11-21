import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cars/bloc/cars_item_bloc.dart';
import 'package:my_cars/pages/cars_list_page.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CarsItemBloc()..add(LoadCarsItems())),
      ],
      child: CarsListPage(),
    );
  }
}
