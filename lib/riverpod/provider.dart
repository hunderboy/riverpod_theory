import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/riverpod/state_notifier_provider.dart';



/// shoppingListNotifierProvider 가 변경되면
/// filteredShoppingListProvider 도 변경된다. = build 요청 반응을 한다는 의미
/// shoppingListNotifierProvider state 그대로 반환
// final filteredShoppingListProvider = Provider(
//     (ref) => ref.watch(shoppingListNotifierProvider),
// );


enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);


final filteredShoppingListProvider = Provider((ref) {
  /// 꼭 watch 를 쓸것. 하위 provider가 변경되면 상위 povider도 변경된다.
  /// Provider 에서 2개를 watch 한다. (2개 관리)
  /// 1. sProvider = ShoppingList Provider
  /// 2. fProvider = Filter Provider
  final sProvider = ref.watch(shoppingListNotifierProvider);
  final fProvider = ref.watch(filterProvider);

  /// all 경우, sProvider 그대로 리턴
  if (fProvider == FilterState.all) {
    return sProvider;
  }

  /// 필터에서
  /// Spicy 경우,
  /// notSpicy 경우,
  return fProvider == FilterState.spicy
      ? sProvider.where((element) => element.isSpicy)   // sProvider 에서 isSpicy == true 인것 만 추출
      : sProvider.where((element) => !element.isSpicy); // sProvider 에서 isSpicy == false 인것 만 추출
});

