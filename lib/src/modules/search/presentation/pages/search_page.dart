import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_github/src/modules/search/presentation/controller/search_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var controller = Modular.get<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            TextFormField(
              onFieldSubmitted: (value) => controller.showUsers(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.search),
                hintText: 'Digite o nome de um usuário',
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, value, child) {
                  return controller.value.when(
                    success: (users) => ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () => Modular.to.pushNamed(
                            '/user',
                            arguments: users[index],
                          ),
                          leading: Hero(
                            tag: users[index].id,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(users[index].avatarUrl),
                            ),
                          ),
                          title: Text(users[index].name),
                        );
                      },
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: () => const Text('error'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
