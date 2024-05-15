import 'package:flutter/material.dart';

import 'user.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${user.firstName} ${user.lastName}'),
            const SizedBox(height: 5),
            Text('Age: ${user.age}'),
            _buildPremium(),
          ],
        ),
      ),
    );
  }

  Widget _buildPremium() {
    if(!user.premium) return const SizedBox();
    return Text('coucou je suis premium');
  }
}
