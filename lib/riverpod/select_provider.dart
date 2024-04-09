import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
  (ref) => SelectNotifier(),
);

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          const ShoppingItemModel(
            name: '김치',
            quantity: 1,
            hasBought: false,
            isSpicy: false,
          ),
  );

  toggleItemName() {
    if (state.name == '김치') {
      state = state.copyWith(
        name: '피자',
      );
    } else {
      state = state.copyWith(
        name: '김치',
      );
    }
  }

  toggleHasBought() {
    /// final 때문에 매번 인스턴스를 새로 넣는 방식 대신에
    // state = ShoppingItemModel(
    //     name: state.name,
    //     quantity: state.quantity,
    //     hasBought: !state.hasBought,
    //     isSpicy: state.isSpicy
    // );
    /// copyWith 방식으로 변경
    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }

  toggleIsSpicy() {
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }


}
