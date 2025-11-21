import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cars/presentation/bloc/cars_item_bloc.dart';
import 'package:my_cars/presentation/pages/cars_products/cars_list_page.dart';
import 'package:my_cars/presentation/pages/discover/discover_page.dart';
import 'package:my_cars/presentation/widgets/custom_bottom_navigation.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final pages = [DiscoverPage(), CarsListPage(), DiscoverPage()];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CarsItemBloc()..add(LoadCarsItems())),
      ],
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: CustomBottomNavigation(
          currentIndex: currentIndex,
          onTap: (i) {
            setState(() {
              currentIndex = i;
            });
          },
        ),
      ),
    );
  }
}
