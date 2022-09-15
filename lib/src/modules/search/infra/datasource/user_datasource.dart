import '../model/user_model.dart';

abstract class UserDatasource {
  Future<List<UserModel>> getUser(String userName);
}
