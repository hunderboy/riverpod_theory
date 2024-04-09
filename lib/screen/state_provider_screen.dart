import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  StateProviderScreen({Key? key}) : super(key: key);

  final commonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.redAccent,
  );
  final todoStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.greenAccent,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider); /// numberProvider 변수값

    return DefaultLayout(
      title: 'Basic Provider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            provider.toString(),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () {
              /// 값 변경 방법 : .state
              /// 값 변경할려면, Provider 뒤에 notifier 붙힐것
              ref.read(numberProvider.notifier).state =
                  ref.read(numberProvider.notifier).state + 1;
            },
            child: const Text('UP',),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.greenAccent,
            ),
            onPressed: () {
              /// 값 변경 방법 : .update
              ref.read(numberProvider.notifier)
                  .update(
                      (state) => state + 1
              );
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
