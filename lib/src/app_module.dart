import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_github/src/modules/search/presentation/pages/user_page.dart';

import 'modules/search/presentation/search_module.dart';
import 'modules/search/presentation/splash/controller/splash_controller.dart';
import 'modules/search/presentation/splash/page/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashView()),
        ChildRoute('/user',
            child: (context, args) => UserPage(
                  user: args.data,
                )),
        ModuleRoute('/pages', module: SearchModule()),
      ];
}
