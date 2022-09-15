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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: widget.user.id,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.user.avatarUrl),
                radius: 100.0,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              widget.user.name,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
