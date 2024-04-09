import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/model/shopping_item_model.dart';
import 'package:riverpod_theory/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final instanceRead = ref.read(shoppingListNotifierProvider.notifier); // 인스턴스만 불러들이는 방법?
    List<ShoppingItemModel> items = ref.watch(shoppingListNotifierProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: items
            .map(
              (e) => CheckboxListTile(
                title: Text('${e.name}(${e.quantity})'),
                value: e.hasBought,
                onChanged: (value) {
                  /// Provider에서 데이터 읽어 오고 싶을때는 read 사용(단발성 액션엔 read)
                  /// ref.read(shoppingListNotifierProvider.notifier) 는 ShoppingListNotifier 의 인스턴스를 호출하는 것!
                  /// 해당 인스턴스를 호출하는 것이니, 메소드를 불러올수 있는것이다.
                  // ref.read(shoppingListNotifierProvider.notifier).toggleTodo(
                  instanceRead.toggleTodo(
                    name: e.name,
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
