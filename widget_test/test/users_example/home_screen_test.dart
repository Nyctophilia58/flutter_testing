import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/users_example/home_screen.dart';
import 'package:widget_test/users_example/user_model.dart';

void main() {
  testWidgets(
    'Displays List of users with name as title and email as subtitle',
    (WidgetTester tester) async {
      // demo users to send
      final users = [
        User(id: 1, name: 'John Doe', email: 'john.doe@gmail.com'),
        User(id: 2, name: 'Jane Smith', email: 'jane.smith@gmail.com'),
      ];

      // we need to pass an future list as users to the HomeScreen
      // -- without delay --
      // Future<List<User>> mockFetchUsers() async {
      //   return users;
      // }
      // -- with delay to simulations network call --
      Future<List<User>> mockFetchUsers() async {
        return Future.delayed(
          const Duration(seconds: 1),
          () => users,
        );
      }

      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            futureUsers: mockFetchUsers(), // required
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // -- without delay --
      // await tester.pump(); // to rebuild the widget after the future is completed
      // -- with delay --
      await tester.pumpAndSettle(); // keeps pumping frames until there are no more frames scheduled
      expect(find.byType(ListView), findsOneWidget);

      expect(find.byType(ListTile), findsNWidgets(users.length));

      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}