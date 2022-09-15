import 'package:flutter/cupertino.dart';
import 'package:search_github/src/modules/search/domain/usecases/get_search_usecase.dart';

import '../state/search_state.dart';

class SearchController extends ValueNotifier<SearchState> {
  final GetSearchUsecase _usecase;

  SearchController(this._usecase) : super(const SearchState.success([]));

  Future showUsers(String user) async {
    value = const SearchState.loading();
    var result = await _usecase(user);
    value = result.fold(
      (l) => const SearchState.error(),
      (r) => SearchState.success(r),
    );
  }
}
