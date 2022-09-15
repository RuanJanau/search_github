
import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/errors/error.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasource/user_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final UserDatasource _datasource;

  SearchRepositoryImpl(this._datasource);
  @override
  Future<Either<Failure, List<UserEntity>>> search(String userName) async {
    try {
      var result = await _datasource.getUser(userName);

      return Right(result);
    } catch (e) {
      log(e.toString());
      return left(Failure());
    }
  }
}
