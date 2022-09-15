import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_github/src/modules/search/domain/usecases/get_search_usecase.dart';
import 'package:search_github/src/modules/search/external/datasource/user_datasource_impl.dart';
import 'package:search_github/src/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:search_github/src/modules/search/presentation/controller/search_controller.dart';
import 'package:search_github/src/modules/search/presentation/pages/user_page.dart';

import 'pages/search_page.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => UserDatasourceImpl(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => GetSearchUsecaseImpl(i())),
        Bind((i) => SearchController(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SearchPage(),
        ),
        ChildRoute(
          '/user',
          child: (context, args) => UserPage(user: args.data),
        )
      ];
}
