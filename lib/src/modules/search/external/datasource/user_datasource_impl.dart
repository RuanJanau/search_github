import 'package:dio/dio.dart';

import '../../domain/errors/error.dart';
import '../../infra/datasource/user_datasource.dart';
import '../../infra/model/user_model.dart';

class UserDatasourceImpl implements UserDatasource {
  final Dio _dio;

  UserDatasourceImpl(this._dio);
  @override
  Future<List<UserModel>> getUser(String userName) async {
    var response =
        await _dio.get('https://api.github.com/search/users?q=$userName');

    if (response.statusCode == 200) {
      return (response.data['items'] as List).map((e) => UserModel.fromMap(e)).toList();
    }
    throw Failure();
  }
}
