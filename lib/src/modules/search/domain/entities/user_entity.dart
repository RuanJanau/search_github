import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final int id;
  final String avatarUrl;
  const UserEntity({
    required this.name,
    required this.id,
    required this.avatarUrl,
  });

  @override
  List<Object> get props => [name, id, avatarUrl];
}
