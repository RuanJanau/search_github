import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var controller = Modular.get<SplashController>();

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (!controller.isLogged()) {
          Modular.to.pushReplacementNamed('/pages');
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 41, 41),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 200.0),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 110,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 115,
                backgroundImage: AssetImage('assets/image/git.png'),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Bem Vindo ',
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
