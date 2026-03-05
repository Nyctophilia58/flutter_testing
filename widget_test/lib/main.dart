import 'package:flutter/material.dart';
import 'package:widget_test/counter/home_page.dart';
import 'package:widget_test/simulations/scrollable_list.dart';
import 'package:widget_test/simulations/user_interaction.dart';
import 'package:widget_test/users_example/home_screen.dart';
import 'package:widget_test/users_example/user_repository.dart';

import 'animation_example/animation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ------ This is the original code for the counter app ------
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Counter App',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //     ),
  //     home: const MyHomePage(title: 'Home Page'),
  //   );
  // }




  // ------ This is the modified code for the users example ------
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Users Example',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: HomeScreen(
  //       futureUsers: UserRepository().fetchUsers(),
  //     ),
  //   );
  // }



  // ------ This is the modified code for the animation example ------
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: const AnimationScreen(),
  //   );
  // }

  // ------ This is the modified code for the animation example ------
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: ScrollableList(items: List<String>.generate(10000, (i) => 'Item $i')),
  //   );
  // }

  static const _appTitle = 'Todo List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserInteraction(appTitle: _appTitle)
    );
  }


}
