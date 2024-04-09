import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/model/shopping_item_model.dart';
import 'package:riverpod_theory/riverpod/select_provider.dart';

// class SelectProviderScreen extends ConsumerWidget {
//   const SelectProviderScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print('build');
//     final name = ref.watch(selectProvider.select((value) => value.name));
//     // listen 또한 select 할 수 있음.
//     ref.listen<String>(selectProvider.select((value) => value.name), (previous, next) {
//       print('previous: $previous / next: $next');
//     });
//
//     return DefaultLayout(
//       title: 'SelectProvider',
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             'name: $name',
//             textAlign: TextAlign.center,
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     ref.read(selectProvider.notifier).toggleItemName();
//                   },
//                   child: const Text('Toggle Name'),
//                 ),
//               ),
//               const SizedBox(width: 16.0),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     ref.read(selectProvider.notifier).toggleIsSpicy();
//                   },
//                   child: const Text('Toggle Spicy'),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

/// select 기능은 특정 값이 변경 됬을 때만 렌더링 되게끔 하는 기능이다.
class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// select 기능은 특정 값이 변경 됬을 때만 렌더링 되게끔 하는 기능이다.
    print('is build??');
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));

    ref.listen(selectProvider.select((value) => value.hasBought), (previous, next) {
      print('next: $next');
    });
    
    return DefaultLayout(
      title: 'SelectProvider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(state.toString()),
          // Text(
          //   'name: ${state.name}',
          //   textAlign: TextAlign.center,
          // ),
          // Text(
          //   'isSpicy: ${state.isSpicy}',
          //   textAlign: TextAlign.center,
          // ),
          // Text(
          //   'hasBought: ${state.hasBought}',
          //   textAlign: TextAlign.center,
          // ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleItemName();
                  },
                  child: const Text('Toggle Name'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleIsSpicy();
                  },
                  child: const Text('Toggle Spicy'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}