
import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';
import '../errors/error.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<UserEntity>>> search(String userName);
}
