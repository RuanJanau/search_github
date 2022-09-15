import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../errors/error.dart';
import '../repositories/search_repository.dart';

abstract class GetSearchUsecase {
  Future<Either<Failure, List<UserEntity>>> call(String userName);
}

class GetSearchUsecaseImpl implements GetSearchUsecase {

  final SearchRepository _repository;

  GetSearchUsecaseImpl(this._repository);
  @override
  Future<Either<Failure, List<UserEntity>>> call(String userName) {
   return _repository.search(userName);
  }
  
}
