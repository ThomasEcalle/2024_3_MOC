import 'package:flutter/material.dart';
import 'package:moc_2024_3/lists_and_scrollables/user.dart';
import 'package:moc_2024_3/lists_and_scrollables/user_list_item.dart';

class ListsAndScrollables extends StatelessWidget {
  const ListsAndScrollables({super.key});

  @override
  Widget build(BuildContext context) {
    final users = List.generate(100, (index) {
      return User(
        firstName: 'Firstname $index',
        lastName: 'Lastname $index',
        age: 20 + index,
        premium: index % 3 == 0,
      );
    });

    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: users.length,
        separatorBuilder: (context, index) {
          if(index % 2 == 0) {
            return Container(
              height: 20,
              color: Colors.red,
            );
          }
          return const SizedBox(height: 20);
        },
        itemBuilder: (context, index) {
          print('Building user $index');
          final user = users[index];
          return UserListItem(user: user);
        },
      ),
    );
  }

  Widget _buildWithSingleChildScrollView(List<User> users) {
    return SingleChildScrollView(
      child: Column(
        children: users.map((user) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: UserListItem(user: user),
          );
        }).toList(),
      ),
    );
  }
}
