// ignore_for_file: slash_for_doc_comments

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/model/shopping_item_model.dart';

// <Notifier 클래스, 관리하는 상태 타입>
final shoppingListNotifierProvider = StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);


/// StateNotifier 를 절대적으로 상속해야 한다.
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  /// 생성자 적용
  ShoppingListNotifier()
      : super(
          [
            const ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            const ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            const ShoppingItemModel(
              name: '불닭소스',
              quantity: 1,
              hasBought: false,
              isSpicy: true,
            ),
            const ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            const ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            const ShoppingItemModel(
              name: '카스테라',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ]
        );

  void toggleTodo({required String name}) {
    // state 는 상속받은 StateNotifier 의 state를 의미한다.
    state = state.map((e) =>
    e.name == name
        ? e.copyWith(hasBought : !e.hasBought)
        : e,
    ).toList();
  }

}
