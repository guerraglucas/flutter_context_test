import 'dart:async';

import 'package:context_test/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_homepage_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<int>(
          // value: _counterBloc.counterStream,
          initialData: _counterBloc.counter,
          create: (_) => _counterBloc.counterStream,
        ),
      ],
      child: Consumer<int>(builder: (context, intProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}
