import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/riverpod/code_generation_provider.dart';
import 'package:riverpod_theory/riverpod/provider.dart';
import 'package:riverpod_theory/riverpod/state_notifier_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // code generation 을 통해 만들어진 gStateProvider(code_generation_provider.g.dart)
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMulitplyProvider(
      number1: 10,
      number2: 20,
    ));
    final state5 = ref.watch(gStateNotifierProvider);

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('state1: $state1'),
          const SizedBox(height: 10,),
          state2.when(
            // data: 로딩후 데이터가 있을때, 반환받은 값
            data: (data) => Text(
              'state2: $data',
              textAlign: TextAlign.center,
            ),
            error: (err, stack) => Text('Error: $err'),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(height: 10,),
          state3.when(
            // data: 로딩후 데이터가 있을때, 반환받은 값
            data: (data) => Text(
              'state3: $data',
              textAlign: TextAlign.center,
            ),
            error: (err, stack) => Text('Error: $err'),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            'state4: $state4',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10,),
          Text(
            'state5: $state5',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: const Text('increment',),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.greenAccent,
                ),
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: const Text('decrement'),
              ),
            ],
          )
        ],
      )
    );
  }
}