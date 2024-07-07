import 'package:flutter/material.dart';
import '../ui/views/home/home_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: HomeView(),
    );
  }
}
