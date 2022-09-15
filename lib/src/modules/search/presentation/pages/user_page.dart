import 'package:flutter/material.dart';
import 'package:search_github/src/modules/search/domain/entities/user_entity.dart';

class UserPage extends StatefulWidget {
  final UserEntity user;
  const UserPage({super.key, required this.user});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.avatarUrl),
              radius: 100.0,
            )
          ],
        ),
      ),
    );
  }
}
