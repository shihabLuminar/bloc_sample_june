import 'package:bloc_sample_june/color_screen/bloc/color_bloc.dart';
import 'package:bloc_sample_june/counter_screen/bloc/counter_bloc.dart';
import 'package:bloc_sample_june/fakestore_screen/bloc/fakestrore_bloc.dart';
import 'package:bloc_sample_june/fakestore_screen/bloc/fakestrore_event.dart';
import 'package:bloc_sample_june/fakestore_screen/view/fakestore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => CounterBloc()),
    BlocProvider(create: (context) => ColorBloc()),
    BlocProvider(
        create: (context) => FakestroreBloc()..add(FetchProductsEvent())),
  ], child: MyApps()));
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FakestoreScreen(),
    );
  }
}
