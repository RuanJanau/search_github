import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';


part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.success(List<UserEntity> users) = _Success;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.error() = _Error;
}
